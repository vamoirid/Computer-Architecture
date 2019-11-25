#include <stdio.h>

int sum = 0, i = 0;

int main()
{
	for(i = 1; i <= 10000; i++)
	{
		sum +=i;
	}

	printf("The sum is: %d\n",sum);

	return 0;
}