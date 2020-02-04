package com.reportViewer.demo;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import lombok.Data;

@Entity
@Data
public class XmlFileStore implements Serializable
{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int serialNumber;

	private String fileName;

	private String fileType;

	private byte[] data;

	public int getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "XmlFileStore [serialNumber=" + serialNumber + ", fileName=" + fileName + ", fileType=" + fileType
				+ ", data=" + Arrays.toString(data) + "]";
	}

}
