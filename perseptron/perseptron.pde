int sign(float j){
  if(j>=0){
    return 1;
  }else{
    return -1;
  }
}

class Perseptron{
  
  float lr=0.1;
  float[] w;

  Perseptron(int n){
    w=new float[n];
    for(int i=0;i<w.length;i++){
      w[i]=random(-1,1);
    }
  }  
  
  int guess(float[] ins){
    float sum=0;
    for(int i=0;i<w.length;i++){
      sum+=ins[i]*w[i];
    }
    return sign(sum);
  }
  
  void train(float[] ins,int target){
    int guess=guess(ins);
    float err=target-guess;
    for(int i=0;i<w.length;i++){
      w[i] += ins[i]*err*lr;
    }
  }
  
  float guessY(int x){
    return -(w[2]/w[1])-w[0]/w[1]*x;
  } 
}