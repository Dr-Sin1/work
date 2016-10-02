//gcc make_matrix_Band.c -std=c99 -lm
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
   if(nnzrow%2==0)
   {
      nnzrow++;
   }
   int L = (nnzrow + 1)/2;
   int nnz = N*nnzrow - L*(L-1);
   double value = 0.1f;

   printf("%%%%MatrixMarket matrix coordinate real general\n");
   printf("%%-------------------------------------------------------------------------------\n");
   printf("%%author:S.Sasaki\n");
   printf("%%-------------------------------------------------------------------------------\n");
   printf("%d\t%d\t%d\n",N,N,nnz);
   
   int LL = L;
   for(int i=0;i<L;++i)
   {
      for(int j=0;j<LL;++j)
      {
         value = Gauss(0.0f,1.0f);
         printf("%d\t%d\t%lf\n",j+1,i+1,value);
      }
      LL++;
   }

   LL=1;
   for(int i=L;i<N-L;++i)
   {
      for(int j=LL;j<LL+nnzrow;++j)
      {
         value = Gauss(0.0f,1.0f);
         printf("%d\t%d\t%lf\n",j+1,i+1,value);
      }
      LL++;
   }

   for(int i=N-L;i<N;++i)
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
