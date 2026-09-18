Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE01C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:27 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11779.1789739664757260902
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=FHeZSStD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F1D50C58478
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:55:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2661B60649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F053F1032900F;
	Fri, 18 Sep 2026 15:54:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rh/gIqeCtoFK6NxjFygexwmdTNT5fiq7TlnERfXfwkA=;
	b=FHeZSStDU6PRHrRu4RJ8yYxzJzYXg/ZoNuIpn1zIJEQTnkuMs6GHEqBSNKYN3obdYUCGKr
	wfX4P+vR0kbi1GW19hXFw7cjg1cLRCE9aBNHTCF8J1nsax7q8bH4Y88EW7qY89eZ8iwy8r
	Ao9bSu0BLISD7ybjVVBYjYHJcKh/KZIihz9Pql5wDuDR0a3ZfvyrCvnHBwunIb4cNdarg8
	gjvH2jmzY2mzW+MbxRhFLlDpS6r5zg/WFDyxb+h5SJ8+j8i54+yFIpOkgNQjdNWoMOqi/7
	g1O4octniZO3w4GKrr+MpKx8/wNMtSNXdbDAQlugO/IdJQiaBVolX4EYr+4q7g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:50 +0200
Subject: [PATCH 20/20] migration-guides/release-notes-6.1.rst: add
 contributors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260918-releases-notes-6-1-v1-20-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5055;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YMqs/o2cF7ZIZM4vLPqDHCLlYDVIjtAocxDGdjkDEVI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJm2yy+jvwRYlR+9BwKktIRVvUFzCYwKQa+v
 E2yoMNxsPqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZgAKCRDRgEFAKaOo
 NkfAEADEu+Lm9ktHwaVpUBSSzZuMD300W30MGhltDTJ8fjDtzm1vIJpHT+JRLuPn+YKi9xmIiJA
 gou5+003CYl5fwa0m7KFyHIF6qmc7ZfeWWo+KPoiFWpz4Xx580P6VV1tpbGTkxpOhUADrTudhip
 /EyWa0o9upNOakA7nv/GuyXnK1sp2EderB6WIamAnyPKgNqRVpkVbGi3+w72pkRW4W3trg3hTV/
 l+gjZ7PzN7Knh05QhXANnS5N5MfOkNGP81RQj3AkaOZ7yQqgfJlHQAgA0kZ21Q7T/qxE1QijOY/
 K1a+FulH1pCL/sc2uzdWADmaYxvbANFet/HDd/M3ryNLslc/0L1IjTvcMrqtXM/kqEnPFUSmihA
 1qZSmGsM0t1W6D7bZl73ZPZcX2o3opagq2T+ouzFTK0A7HzAGuQN+oRC90I/VZj1HrftchP1/XS
 hyyosbPyN/uE4obPJYUbaOFXqs8PCD8Uv/Ys+ns2A0FC5HiHrU1xAYFu2q9Nmve9Z3h/jfj5Z6G
 RXvdoLPI6LdYm0mA8Y6zGcJ9CpPSzIaV8k9+l7Y8ecM/vvPM/iBBo8QoiUo0oOAzBauTEwF83b8
 91UOoewJDwXRtGbAHo3lIL0Q3algLBhQohI4QkkBC9KA3MO76QLch+9B2gv3+zKG1sI3duJUh3e
 GRq0jx8DB/6q9cg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10552

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.1.rst         | 223 +++++++++++++++=
++++++
 1 file changed, 223 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/docum=
entation/migration-guides/release-notes-6.1.rst
index 6fac0513f..396c5a526 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -2012,5 +2012,228 @@ Contributors to |yocto-ver|
=20
 Thanks to the following people who contributed to this release:
=20
+-  Adam Blank
+-  Adam Duskett
+-  Adarsh Jagadish Kamini
+-  Aditya GS
+-  Adrian Freihofer
+-  Alejandro Hernandez Samaniego
+-  Alejandro Mery
+-  Alessandro Zini
+-  Alexander Kanavin
+-  Alexander Stein
+-  Alex Kiernan
+-  Amaury Couderc
+-  Anders Heimer
+-  Andreas M=C3=BCtzel
+-  Andrei Lalaev
+-  Andrej Valek
+-  Andrew Geissler
+-  Anis Bougrine
+-  Ankur Tyagi
+-  Anthony Squires
+-  Antoine Gouby
+-  Antonin Godard
+-  Anton Skorup
+-  Aravind Bandari
+-  AshishKumar Mishra
+-  Aswin Murugan
+-  Aurelien DESBRIERES
+-  Baban
+-  Babanpreet Singh
+-  Benjamin Robin
+-  Bin Cao
+-  Bruce Ashfield
+-  Changqing Li
+-  Chen Qi
+-  Chris Laplante
+-  Colin Pinnell McAllister
+-  Corentin Guillevic
+-  Daiane Angolini
+-  Daniel Dragomir
+-  Daniel McGregor
+-  Daniel Turull
+-  David Nystr=C3=B6m
+-  David Reyna
+-  Dawid Bijak
+-  Deepesh Varatharajan
+-  Denys Dmytriyenko
+-  Devansh Patel
+-  Dmitry Baryshkov
+-  Dmitry Sakhonchik
+-  Efe Can Icoz
+-  Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in
+-  El Mehdi YOUNES
+-  Enoch Ng
+-  Enzo Frese
+-  Eric Meyers
+-  Ernest Van Hoecke
+-  Esa Jaaskela
+-  Etienne Cordonnier
+-  Fabian Pflug
+-  Fabien Lehoussel
+-  Fabio Estevam
+-  Florin Diaconescu
+-  Francesco Valla
+-  Francisco Pedraza
+-  Fredrik Svensson (svsvenss)
+-  Frieder Schrempf
+-  Gabriel Smith
+-  Gavvala, Kris
+-  George Refseth
+-  Ghanshyam Banait
+-  Gu=C3=B0ni M=C3=A1r Gilbert
+-  Gustavo Henrique Nihei
+-  Haiqing Bai
+-  Haixiao Yan
+-  Hangtian Zhu
+-  Harald Brinkmann
+-  Harish Sadineni
+-  Hemanth Kumar M D
+-  Hetvi Thakar
+-  Hiago De Franco
+-  Himani Barde
+-  Himani Ramesh Barde
+-  Himanshu Jadon
+-  hongxu
+-  Igor Opaniuk
+-  Ivan Nestlerode
+-  jaekyu.lee
+-  Jaeyoon Jung
+-  Jaipaul Cheernam
+-  Jamin Lin
+-  Jan Vermaete
+-  Jate Sujjavanich
+-  Jesse Van Gavere
+-  Jinfeng Wang
+-  Jinwang Li
+-  Joao Marcos Costa
+-  Jo=C3=A3o Marcos Costa
+-  Johan Anderholm
+-  John Ripple
+-  Jonas Juffinger
+-  J=C3=B6rg Sommer
+-  Jose Quaresma
+-  Joshua Watt
+-  Juhandr=C3=A9 Knoetze
+-  Junjie Cao
+-  Kanksha Paturi
+-  Karthik
+-  KAZUYOSHI AKIYAMA (=E7=A7=8B=E5=B1=B1 =E5=92=8C=E6=85=B6)
+-  Khem Raj
+-  Kris Gavvala
+-  Kyungjik Min
+-  Lee Chee Yang
+-  Leon Anavi
+-  Leonardo Costa
+-  Leonid Iziumtsev
+-  Levi Shafter
+-  Lian Wang
+-  Li Wang
+-  Li Zhou
+-  Luca Fancellu
+-  Marcio Henriques
+-  Marcus Flyckt
+-  Marek Vasut
+-  Mark Hatle
+-  Mark Jonas
+-  Markus Swarowsky
+-  Markus Volk
+-  mark.yang
+-  Marta Rybczynska
+-  Martin Jansa
+-  Mathieu Dubois-Briand
+-  Matt Madison
+-  Mengshi Wu
+-  Michael Halstead
+-  Michael Opdenacker
+-  Michael Tretter
+-  Michal Sieron
+-  Mikko Rapeli
+-  Mingli Yu
+-  Minwoo Choi
+-  Moritz Haase
+-  Nate Kent
+-  Nathaniel White
+-  Nick Owens
+-  Nico
+-  Nicolas Dechesne
+-  Niko Mauno
+-  Nora Schiffer
+-  Oleksiy Obitotskyy
+-  Omkar Patil
+-  Otavio Salvador
+-  Pascal Eberhard
+-  Paul Barker
+-  Paul Eggleton
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Peter Tatrai
+-  Philip Lorenz
+-  Prabhudasu Vatala
+-  Pratik Farkase
+-  Quan Sun
+-  Quentin Schulz
+-  Rasmus Villemoes
+-  Ricardo Salveti
+-  Richard Purdie
+-  Robert P. J. Day
+-  Robert Yang
+-  Rob Woolley
+-  Roland Kovacs
+-  Ross Burton
+-  Rouven Czerwinski
+-  Rouven Rastetter
+-  Ryan Eatmon
+-  Sai Sneha
+-  Sam Kent
+-  Sandeep J
+-  Sebastian Muxel
+-  Sergio Prado
+-  sh0127.shin
+-  Shinu Chandran
+-  Siddharth Doshi
+-  Siva Balasubramanian
+-  Sudhir Dumbhare
+-  Sumanth Gavini
+-  Sundeep KOKKONDA
+-  Sunil Dora
+-  Tafil Avdyli
+-  Tan Siewert
+-  Taruntej Kanakamalla
+-  Tejas Kanfade
+-  Theo Gaige (Schneider Electric)
+-  Thomas Perrot
+-  Thorsten Schmelzer
+-  Thune Tran
+-  Tim Orling
+-  Trevor Gamblin
+-  Trevor Woerner
+-  T, Sai Sireesha
+-  Tushar Darote
+-  Ulrich =C3=96lmann
+-  Vijay Anusuri
+-  Viswanath Kraleti
+-  Vivek Puar
+-  Vyacheslav Yurkov
+-  Walter Werner Schneider
+-  Wang Mingyu
+-  Wei Deng
+-  Wei Gao
+-  Wei Zhang
+-  Wenwen Fu
+-  Wes Malone
+-  WXbet
+-  Xiaozhan Li
+-  Xiuzhuo Shang
+-  Yann Dirson
+-  Yash Shinde
+-  Yoann Congal
+-  Yogesh Tyagi
+-  Zheng Ruoqin
+-  Zhixiong Chi
+-  Zk47T
+-  Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
+
 Repositories / Downloads for Yocto-|yocto-ver|
 ----------------------------------------------

--=20
2.55.0


