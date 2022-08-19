### docker
require "json"
def filter(tag, time, record)
    edit_json(record)
end
def edit_json(record)
    if not record.has_key? "type"
        cpu=8
        if record['host'].include? "rancherbe"
            cpu=6
        end

        s=record['Name']
        part=s[3, 4]
        s1=s[7..-1]
        if s1.include? part
            p=s1.index(part)
            p=p+3
            record['Name']=s[4,p]
            else
                if s.include? "fluentd-log_linkedin-crawler"
                    record['Name']="fluentd-log_linkedin-crawler"
                end
            end

            record['MemPerc'] = record['MemPerc'].to_i
            record['CPUPerc'] = record['CPUPerc'].to_i
            record['cpu_usage'] = (record['CPUPerc']/cpu).to_i
            record['cpu_max'] = cpu * 100
            record['type'] = "docker"
    end 
    record
end