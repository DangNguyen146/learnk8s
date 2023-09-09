package prototype

/* INOde is interface */
type INode interface{
	Clone() INode
	Print(s string)
}