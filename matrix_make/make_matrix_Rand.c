//gcc make_matrix_Rand.c -std=c99 -lm
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
   //double z=sqrt( -1.0f*log(Uniform()) ) * sin( 1.0f*PI*Uniform() );
   double z = Uniform();
   return mu + sigma*z;
}

void Rand_Vector(int *vec, double w, int nnzrow)
{
   for(int i=0;i<nnzrow;++i)
   {
      vec[i] = Gauss((double)i,1.0f) * w;
   }
}

int main(int argc,char **argv)
{
   int N = atoi(argv[1]);
   int nnzrow = atoi(argv[2]);
   int nnz = N*nnzrow;
   double w = (double)N/(double)nnzrow;
   double value = 0.1f;

   int *row;
   posix_memalign((void**)(&row), 8, sizeof(int) * nnzrow);

   printf("%%%%MatrixMarket matrix coordinate real general\n");
   printf("%%-------------------------------------------------------------------------------\n");
   printf("%%author:S.Sasaki\n");
   printf("%%-------------------------------------------------------------------------------\n");
   printf("%d\t%d\t%d\n",N,N,nnz);
   
   int LL=0;
   for(int i=0;i<N;++i)
   {
      for(int j=0;j<nnzrow;++j)
      {
         value = Gauss(0.0f,1.0f);
         Rand_Vector(row,w,nnzrow);
         printf("%d\t%d\t%lf\n",row[j]+1,i+1,value);
      }
      LL++;
   }

   return 0;
}
