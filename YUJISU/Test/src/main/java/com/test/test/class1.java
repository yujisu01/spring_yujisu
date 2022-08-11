package com.test.test;

public class class1 {
	public static void main(String[] args) {
//		for(int i=2; i<10; i++) {
//			for(int y=1; y<10; y++) {
//				System.out.println(i*y);
//			}
//		}
		
		
		
		// �뵾蹂대굹移� �닔�뿴
		// 1,1,2,3,5,8,13,21,34,55,89,....
		// 30踰덉㎏ �뵾蹂대굹移� �닔�뿴��?
		
		
		// 1 ~ 100�쓽 �닔以묒뿉
		// 3怨� 5�쓽 諛곗닔�뿉�뒗 bizzfuzz瑜� 異쒕젰�떆耳쒕씪
		// 3�쓽諛곗닔�뿉�뒗 bizz
		// 5�쓽 諛곗닔�뿉�뒗 fuzz
		// �굹癒몄��뒗 洹몃깷 異쒕젰
		// ex) 1,2,bizz,4,fuzz,bizz,7,8,bizz,....,13,14,bizzfuzz,..
		// 한글 
		
			for(int i = 1; i< 101; i++) {
				if(i%(3*5)==0) {
					System.out.println("bizzfuzz");
				}else if(i%5==0) {
					System.out.println("fuzz");
				}else if(i%3==0) {
					System.out.println("와아아아아");
				}else
				{
					System.out.println(i);
				}
			}
		
		
	}

}
