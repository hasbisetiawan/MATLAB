%---------------------------------------------------------------------
%PROJECT UAS KALKULUS
%Program Pelacak Keuangan Pribadi 
%Oleh : Kelompok N
%Anggota : Hasbi Setiawan[231810201043] & Fikri Setiawan[231810201054]
%File : N_Hasbi&Fikri
%---------------------------------------------------------------------

function PelacakKeuanganPribadi()
    clc;
    disp('|--------------------------------------------------|');
    disp('|    Selamat datang di Pelacak Keuangan Pribadi    |');
    disp('|   Catat dan kelola keuangan Anda dengan mudah!   |');
    disp('|--------------------------------------------------|');

    saldoAwal = input('Masukkan saldo awal: ');
    
    riwayatTransaksi = struct('Keterangan', {}, 'Jumlah', {}, 'SaldoAkhir', {});
    totalPengeluaran = 0;

    while true
        clc;
        disp('|--------------------------------------------------|');
        disp('|    Selamat datang di Pelacak Keuangan Pribadi    |');
        disp('|   Catat dan kelola keuangan Anda dengan mudah!   |');
        disp('|--------------------------------------------------|');
        disp('Opsi : 1. Pengeluaran | 2. Pendapatan | 3. Selesai');
        disp(['Saldo awal: ', num2str(saldoAwal)]);
        disp(['Total Pengeluaran: ', num2str(totalPengeluaran)]);

        pilihanOpsi = input('Masukkan nomor opsi: ');

        if pilihanOpsi == 1
            keterangan = input('Masukkan keterangan pengeluaran: ', 's');
            jumlahTransaksi = -abs(input('Masukkan jumlah pengeluaran: '));
            transaksi = struct('Keterangan', keterangan, 'Jumlah', jumlahTransaksi, 'SaldoAkhir', saldoAwal + jumlahTransaksi);
            riwayatTransaksi = [riwayatTransaksi, transaksi];
            totalPengeluaran = totalPengeluaran + abs(jumlahTransaksi);
        elseif pilihanOpsi == 2
            keterangan = input('Masukkan keterangan pendapatan: ', 's');
            jumlahTransaksi = abs(input('Masukkan jumlah pendapatan: '));
            transaksi = struct('Keterangan', keterangan, 'Jumlah', jumlahTransaksi, 'SaldoAkhir', saldoAwal + jumlahTransaksi);
            riwayatTransaksi = [riwayatTransaksi, transaksi]; 
        elseif pilihanOpsi == 3
            disp('Sedang di proses')
            pause(4);
            break;
        else
            disp('Pilihan opsi tidak valid. Silakan masukkan nomor opsi yang benar.');
            pause(2);
            continue;
        end
        saldoAwal = saldoAwal + jumlahTransaksi;
        pause(2);
    end

    clc;
    disp('--------------------------------------------------');
    disp('                Ringkasan Keuangan                ');
    disp('--------------------------------------------------');
    for i = 1:length(riwayatTransaksi)
        disp(['Transaksi ke-', num2str(i), ': ', num2str(riwayatTransaksi(i).Jumlah), ', Keterangan: ', riwayatTransaksi(i).Keterangan, ', Saldo Akhir: ', num2str(riwayatTransaksi(i).SaldoAkhir)]);
    end
    disp('                                             ');
    disp('--------------------------------------------------');
    disp('                 Informasi Boros                  ');
    disp('--------------------------------------------------');
    if totalPengeluaran > 1000000
        disp('Anda telah mengeluarkan uang terlalu boros!');
    elseif totalPengeluaran > 500000
        disp('Anda telah mengeluarkan uang sangat boros!');
    elseif totalPengeluaran > 150000
        disp('Anda telah mengeluarkan uang boros!');
    else
        disp('Anda telah mengelola keuangan Anda dengan baik.');
    end
end