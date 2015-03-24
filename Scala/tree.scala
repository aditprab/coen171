//Binary search tree implementation- Scala.
object BinaryTree{
	case class node(data: Int, left:node , right: node)
	
	def main(args: Array[String]){
		Console.println("This is a testing function that is running")
		Console.println("First, this will input 10 numbers to a tree. The root will be a 3.")
		val root = node(3, null, null)
		Console.println("Inputing 17, 200, 19, 30, 40, 32, 11, 18, 22")
		addNode(root, 17)
		addNode(root, 200)
		addNode(root, 19)
		addNode(root, 30)
		addNode(root, 40)
		addNode(root, 32)
		addNode(root, 11)
		addNode(root, 18)
		addNode(root, 22)

		Console.println("Now checking if 17 is a member")
		Console.println(isMember(root, 17))
		Console.println("Now checking if 12 is a member")
		Console.println(isMember(root, 12))

	}

	def isMember(root: node, data: Int): Boolean = {
	
		if(root == null)
		{
			false
		}

		else if(data > root.data){
			isMember(root.right, data)
		}

		else if(data < root.data){
			isMember(root.left, data)
		}

		else{
			true
		}
	}

	def addNode(root: node, data: Int): node ={
		//Returns node that was added. 
		  if(root == null){
		  		//Root is null, so node will be root. 
		  		node(data, null, null);
		  }

		  else if(data < root.data){
		  		//go left.
		  		node(root.data, addNode(root.left, data), root.right)
		  }

		  else{
		  		node(root.data, root.left, addNode(root.right, data))
		  }
	}

}	