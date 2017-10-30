package com.xsis.training125.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class History {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private int id_peminjaman;
	private int id_pengembalian;
	private int id_peminjam;
	private int id_karyawan;
	private int id_transaksi;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="history")
    private List<Employee> employees;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="history")
	private List<Customer> customers;
	
	public History() {
		
	}
	
	public History(int id, int id_peminjaman, int id_pengembalian, int id_peminjam, int id_karyawan, int id_transaksi) {
		super();
		this.id = id;
		this.id_peminjaman = id_peminjaman;
		this.id_pengembalian = id_pengembalian;
		this.id_peminjam = id_peminjam;
		this.id_karyawan = id_karyawan;
		this.id_transaksi = id_transaksi;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_peminjaman() {
		return id_peminjaman;
	}

	public void setId_peminjaman(int id_peminjaman) {
		this.id_peminjaman = id_peminjaman;
	}

	public int getId_pengembalian() {
		return id_pengembalian;
	}

	public void setId_pengembalian(int id_pengembalian) {
		this.id_pengembalian = id_pengembalian;
	}

	public int getId_peminjam() {
		return id_peminjam;
	}

	public void setId_peminjam(int id_peminjam) {
		this.id_peminjam = id_peminjam;
	}

	public int getId_karyawan() {
		return id_karyawan;
	}

	public void setId_karyawan(int id_karyawan) {
		this.id_karyawan = id_karyawan;
	}

	public int getId_transaksi() {
		return id_transaksi;
	}

	public void setId_transaksi(int id_transaksi) {
		this.id_transaksi = id_transaksi;
	}
}
