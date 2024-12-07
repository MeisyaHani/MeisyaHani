-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Des 2024 pada 02.57
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaseapotek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `u[date_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `u[date_at`) VALUES
(1, 'Furniture', 'Home and office furniture', '0000-00-00 00:00:00', '2024-11-29'),
(2, 'obat resep', 'Obat yang memerlukan resep dokter', '2024-11-30 03:00:00', '2024-11-30'),
(3, 'Vitamin & Suplemen', 'Vitamin dan suplemen kesehatan', '2024-11-30 03:00:00', '2024-11-30'),
(4, 'Alat Kesehatan', 'Peralatan medis dan kesehatan', '2024-11-30 03:00:00', '2024-11-30'),
(5, 'obat generik', 'Obat generik tanpa merek dagang', '2024-11-30 17:00:00', '2024-12-03'),
(6, 'Produk Herbal', 'Produk berbahan dasar herbal alami', '2024-11-30 17:00:00', '2024-12-03'),
(7, 'perawatan luka', 'Produk untuk mengobati luka ringan atau serius', '2024-11-30 17:00:00', '2024-12-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity_in_stock`, `created_at`, `updated_at`) VALUES
(1, 1, 20, '2024-11-28 17:00:00', '2024-11-21'),
(2, 2, 50, '2024-11-30 03:10:00', '2024-11-30'),
(3, 3, 200, '2024-11-30 03:10:00', '2024-11-30'),
(4, 4, 30, '2024-11-30 03:10:00', '2024-11-30'),
(5, 5, 150, '2024-12-01 03:00:00', '2024-11-03'),
(6, 6, 15, '2024-12-01 03:00:00', '2024-11-03'),
(7, 7, 35, '2024-12-01 03:00:00', '2024-11-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `sales_id`, `amount_paid`, `payment_method`, `payment_date`) VALUES
(1, 1, 1000.00, 'Cash', '2024-11-28 17:00:00'),
(2, 2, 150000.00, 'Debit Card', '2024-11-30 03:20:00'),
(3, 3, 75000.00, 'credit card', '2024-11-30 03:20:00'),
(4, 4, 250000.00, 'Debit Card', '2024-12-01 08:00:00'),
(5, 5, 20000.00, 'cash', '2024-12-01 07:30:00'),
(6, 6, 140000.00, 'Cash', '2024-12-01 07:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `price`, `stok`, `created_at`, `update_at`) VALUES
(1, 1, 'Laptop', 'Lightweight and powerful for work and gaming', 1200.00, 20, '2024-11-28 17:00:00', '2024-11-29'),
(2, 2, 'Amoxicillin 500mg', 'Antibiotik untuk infeksi bakteri', 20000.00, 3, '2024-11-30 03:30:00', '2024-11-30'),
(3, 3, 'vitamin C 500mg', 'Suplemen untuk meningkatkan imun', 25000.00, 50, '2024-11-15 03:30:00', '2024-11-15'),
(4, 4, 'Termometer Digital', 'Alat untuk mengukur suhu tubuh', 60000.00, 20, '2024-11-02 03:30:00', '2024-11-02'),
(5, 5, 'madu hitam', 'Madu herbal untuk meningkatkan daya tahan tubuh', 50000.00, 50, '2024-12-01 03:00:00', '2024-11-01'),
(6, 6, 'minyak bulus', 'Minyak', 50000.00, 15, '2024-12-01 03:00:00', '2024-11-01'),
(7, 7, 'betadine', 'Antiseptik untuk luka ringan', 15000.00, 88, '2024-12-01 03:00:00', '2024-11-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_supplier`
--

CREATE TABLE `product_supplier` (
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product_supplier`
--

INSERT INTO `product_supplier` (`product_id`, `supplier_id`) VALUES
(1, 1),
(2, 1),
(4, 1),
(6, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchaces`
--

CREATE TABLE `purchaces` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `purchaces`
--

INSERT INTO `purchaces` (`id`, `product_id`, `quantity`, `total_price`, `supplier_id`, `created_at`) VALUES
(1, 1, 20, 5000.00, 1, '2024-11-28 17:00:00'),
(2, 2, 30, 40000.00, 2, '2024-11-30 03:50:00'),
(3, 3, 20, 2000.00, 3, '2024-11-30 03:50:00'),
(4, 5, 50, 25000.00, 4, '2024-12-01 02:00:00'),
(5, 6, 100, 75000.00, 3, '2024-12-01 03:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `quantity`, `total_price`, `created_at`) VALUES
(1, 1, 2, 1000.00, '2024-11-28 17:00:00'),
(2, 2, 15, 25000.00, '2024-11-30 03:50:00'),
(3, 3, 20, 15000.00, '2024-11-30 04:00:00'),
(4, 4, 2, 50000.00, '2024-11-30 04:00:00'),
(5, 5, 10, 5000.00, '2024-12-01 05:00:00'),
(6, 6, 20, 150000.00, '2024-12-01 05:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contant_number` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(59) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contant_number`, `address`, `email`, `created_at`, `update_at`) VALUES
(1, 'Furniture Depot', '0887654321', '456 Furniture Ave', 'support@furnituredepot.com', '2024-11-28 17:00:00', '0024-11-29'),
(2, 'UD vitamin ', '0876534597', 'vitamin ', 'lili@gmail.com', '2024-11-30 04:00:00', '2024-11-30'),
(3, 'Alkes Medisindo', '085456890', '-', 'jaehyun@gmail.com', '2024-11-30 04:00:00', '2024-11-30'),
(4, 'Farmasi utama', '0865432', '', 'farmasi@gmail.com', '2024-11-30 04:00:00', '2024-11-30'),
(5, 'PT obat sehati', '0811234567', 'Jl. Sehat No 8', 'sehati@gmail.com', '2024-12-01 01:00:00', '2024-12-01'),
(6, ' Apotek Sehat', '087653345', 'Jl. Raya Anggrek No 10', 'sehat@gmail.com', '0000-00-00 00:00:00', '2024-12-01'),
(7, ' Apotek Sehat', '087653345', 'Jl. Raya Anggrek No 10', 'sehat@gmail.com', '0000-00-00 00:00:00', '2024-12-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `created_at`, `updated_at`) VALUES
(1, 'rubyJane', 'blackpink', 'rubyJane@example.com', '2024-11-28 17:00:00', '2024-11-28 17:00:00'),
(2, 'admin', 'example_password', 'admin@gmail.com', '2024-11-30 04:00:00', '2024-11-30 04:00:00'),
(3, 'kasir1', 'example_password', 'kasir1@gmail.com', '2024-11-30 04:00:00', '2024-11-30 13:00:00'),
(4, 'kasir2', 'kasir2_paassword', 'kasir2@gmail.com', '2024-11-30 04:00:00', '2024-11-30 04:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `addres` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `full_name`, `phone_number`, `addres`) VALUES
(1, 1, 'JennierubyJane', '08444555666', '456 korea Street'),
(2, 2, 'kim jihyo', '08444555666', 'Jl. Apotek sehat No 6'),
(3, 3, 'Roseanne', '08652427', 'Jl. bunga No 2'),
(4, 4, 'scoups', '086251417', 'jl. Seventeen No 7'),
(5, 1, 'rubyjane', '0876456', 'YG ');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `name` (`name`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `name` (`name`);

--
-- Indeks untuk tabel `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indeks untuk tabel `purchaces`
--
ALTER TABLE `purchaces`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `name` (`name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `username` (`username`),
  ADD KEY `id` (`id`),
  ADD KEY `email` (`email`);

--
-- Indeks untuk tabel `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `purchaces`
--
ALTER TABLE `purchaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_supplier_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
