/* 2b: Before optimization, the main loops would deference the three pointers every iteration
 *     , now the main loop uses local variables to store the values and then deferencing them 
 *     after the main loop to store the final values.
 * 2c: After optimization, the three main loops get combined to one main loop and by unrolling 
 *     loops the main loop runs 5 times less and sub loop runs 2 times less.
 *
 */
void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    int i, j;
    int num_passed_total = 0;
    float avg_total = 0.0;
    float passing_avg_total = 0.0;
    if (N <= 0) return;
    for (i = 0; i < N-4; i+=5) {
        // init ranks
        R[i] = 1;
        R[i+1] = 1;
        R[i+2] = 1;
        R[i+3] = 1;
        R[i+4] = 1;
        // compute ranks
        for (j = 0; j < N-1; j+=2) {
            if (F[i] < F[j]) {
                R[i] += 1;
            }
            if (F[i] < F[j+1]) {
                R[i] += 1;
            }
            if (F[i+1] < F[j]) {
                R[i+1] += 1;
            }
            if (F[i+1] < F[j+1]) {
                R[i+1] += 1;
            }
            if (F[i+2] < F[j]) {
                R[i+2] += 1;
            }
            if (F[i+2] < F[j+1]) {
                R[i+2] += 1;
            }
            if (F[i+3] < F[j]) {
                R[i+3] += 1;
            }
            if (F[i+3] < F[j+1]) {
                R[i+3] += 1;
            }
            if (F[i+4] < F[j]) {
                R[i+4] += 1;
            }
            if (F[i+4] < F[j+1]) {
                R[i+4] += 1;
            }
        }
        // compute averages
        avg_total += F[i];
        avg_total += F[i+1];
        avg_total += F[i+2];
        avg_total += F[i+3];
        avg_total += F[i+4];
        if (F[i] >= 50.0) {
            passing_avg_total += F[i];
            num_passed_total += 1;
        }
        if (F[i+1] >= 50.0) {
            passing_avg_total += F[i+1];
            num_passed_total += 1;
        }
        if (F[i+2] >= 50.0) {
            passing_avg_total += F[i+2];
            num_passed_total += 1;
        }
        if (F[i+3] >= 50.0) {
            passing_avg_total += F[i+3];
            num_passed_total += 1;
        }
        if (F[i+4] >= 50.0) {
            passing_avg_total += F[i+4];
            num_passed_total += 1;
        }
    }
    // check for div by 0
    avg_total /= N;
    if (num_passed_total > 0) passing_avg_total /= num_passed_total;
    *num_passed = num_passed_total;
    *avg = avg_total;
    *passing_avg = passing_avg_total;
} // compute_ranks

