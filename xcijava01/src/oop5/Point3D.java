package oop5;

public class Point3D extends Point2D{
	int z;
	
	public Point3D(int x, int y, int z) {
		super(x,y);
		this.z = z;
		System.out.println("Point2D(x,y,z) 수행");
	}

	public Point3D() {
		this(1000,2000,3000);
	}
}
