//gcc make_matrix_SingleBand.c -std=c99 -lm
//./a.out <N> <nnz/row>
#include<stdlib.h>
#include<stdio.h>
#include<math.h>
#include<string.h>

#define PI 3.14159265358979f

double Uniform( void ){
   return ((double)rand())/((double)RAND_MAX);
}

double Gauss( double mu, double sigma )
{
   double z=sqrt( -2.0f*log(Uniform()) ) * sin( 2.0f*PI*Uniform() );
   return mu + sigma*z;
}

int main(int argc,char **argv)
{
   int N = atoi(argv[1]);
   int nnzrow = atoi(argv[2]);
   int nnz = N*nnzrow - nnzrow*(nnzrow-1)/2;
   double value = 0.1f;

   printf("%%%%MatrixMarket matrix coordinate real general\n");
   printf("%%-------------------------------------------------------------------------------\n");
   printf("%%author:S.Sasaki\n");
   printf("%%-------------------------------------------------------------------------------\n");
   printf("%d\t%d\t%d\n",N,N,nnz);
   
   int LL=0;
   for(int i=0;i<N-nnzrow;++i)
   {
      for(int j=LL;j<LL+nnzrow;++j)
      {
         value = Gauss(0.0f,1.0f);
         printf("%d\t%d\t%lf\n",j+1,i+1,value);
      }
      LL++;
   }

   for(int i=N-nnzrow;i<N;++i)
   {
      for(int j=LL;j<N;++j)
      {
         value = Gauss(0.0f,1.0f);
         printf("%d\t%d\t%lf\n",j+1,i+1,value);
      }
      LL++;
   }

   return 0;
}
