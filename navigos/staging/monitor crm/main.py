# import _scproxy
import pymssql
import sys
from optparse import OptionParser

def main(server, user, password, database,pub,name):
    try:
        session1 = pymssql.connect(
            server=server,
            user=user,
            password=password,
            database=database
        )
    except:
        print("Error connect SQL Server!")
        sys.exit(1)
    cur1 = session1.cursor()
    cur1.execute("""SELECT TOP 1
            a.name PublicationName
            , a.publication Publication
            , ditosu.comments AS MessageText
            , ditosu.[time] CommandDate
            , ditosu.xact_seqno xact_seqno
            , ditosu.error_id ERRORID
            FROM MSdistribution_agents a
            INNER JOIN MSpublications p ON a.publisher_db = p.publisher_db
            AND a.publication = p.publication
            INNER JOIN MSdistribution_history ditosu ON ditosu.agent_id = a.id
            where a.publication = '""" + pub + """'
            and a.name = '""" + name + """'
            and ditosu.comments NOT LIKE '%<stats state%'
            ORDER BY ditosu.[time] DESC""")

    data = cur1.fetchall()
    for i in data:
        try:
            if i[5] != 0:
                print('STATUS: CRITICAL-DB slave ALERT: ', i[2])
                sys.exit(CRITICAL)
            if i[5] == 0:

                if i[2] == 'A DDL change has been replicated.':
                    print('STATUS: WARNING-Someone has change ddl, WARNING: ', i[2])
                    sys.exit(WARNING)
                else:
                    print('STATUS: OK-DB slave INFORM: ', i[2])
                    sys.exit(OK)
        except:
            continue
OK = 0
WARNING = 1
CRITICAL = 2
UNKNOWN = 3

parser = OptionParser(add_help_option=False)
parser.add_option(
    "-h", dest="server", type="string",
    help="sql server", metavar=' ')
parser.add_option(
    "-u", dest="user", type="string",
    help="sql user", metavar=' ')
parser.add_option(
    "-p", dest="password", type="string",
    help="sql password", metavar=' ')
parser.add_option(
    "-d", dest="database", type="string",
    help="database", metavar=' ')
parser.add_option(
    "-o", dest="pub", type="string",
    help="pub", metavar=' ')
parser.add_option(
    "-n", dest="name", type="string",
    help="name", metavar=' ')
(options, args) = parser.parse_args()
for option in ('server', 'user', 'password', 'database', 'pub', 'name'):
    if not getattr(options, option):
        print("Option %s not specified" % option)
        parser.print_help()
        sys.exit(UNKNOWN)
main(options.server, options.user, options.password, options.database,options.pub,options.name)
