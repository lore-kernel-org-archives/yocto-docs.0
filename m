Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122E3F9EDE0
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83722.1776867788081720762
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=CNcLaRbX;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 033AAC5C3CD
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F10B5FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F00010460B10;
	Wed, 22 Apr 2026 16:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JA9/6ipB2cYs3dpU+/jlEx/Gvx4b0RWAfnWjaAylxeY=;
	b=CNcLaRbXzkO1dzyG37vc3e15F7gFMElQuukR8vBjUPOUzDujq3ssmeGJK/KY46TkVY8d+p
	Y+7iCJ7oyTaiucUpMstx9+hQAo0DnFDNZKvK+Ls8Yp87/vsuQds14vQA2k4+5NFR0of2i5
	XgPnGKKs4Nh4bJV7/IIhyYRzi3TS/RDW51Fq7xgEzLgNVmA4STlocCRLtoZ5nAbsLdGnof
	d5sZQxrC/2+rFBwxJOsDgIJpoc32f6bsaevpAxcR4T/m0dBCW43dnCqAhNYh2uHRe4iGsY
	oWGxpgCQqbgInZ4cSqjzdrQX2TNf9BlvEU/ScKPYOYzG+BAqMF7FrAGTYs7SYA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:49 +0200
Subject: [PATCH 16/16] migration-guides/release-notes-6.0.rst: add
 contributors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260422-third-release-notes-6-0-v1-16-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4655;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/hNPR9dcorgoVoXMWx0yrFkPF0M+Y1ChA4uMbdfJlWY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm6HOKS0K6zxvWneA6K1v9qZv4SaTA7V9/se
 B1m3y2lUp2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZugAKCRDRgEFAKaOo
 Nj4tD/9AuL9WQD0i4hLOSjSPbYTMdDvD6RJsLNcjSnxUztHewpCBKgOuvRU14hcCE4sapQ3MbsT
 5tOWAtQ/AwTXY+/2iQqGY35r1v79078c56ro9ubNvlsaKtdu7xtl/INiCuupYi7AWCl22Guiequ
 xSgsv5OnEoVu+F903xFuZf3X5nfe4jHZwVdViF4g3jBcmitvUUpa7MBmnC1mWWOp1Sy7VdxoDU0
 b2NMA+cJoT53UZJ9VQHBj6OHapnhX3qz/joK1OgCA1+gh2LdKOP4ZJKH1qExn1Cj9TzHWK+Da3q
 rXsoaGDdQZD4BxAh5ygTL06K6feiN4JdTONvccTjzYsX6Koxav4Up07KZgyuRKH5vJv3pvL+mIB
 ZVcR2zy4Mn6oOvVSQNPfFHAPUQBCyJGUCNi6jYQpPL5Q6LOY5Qbai9QwcIk59gzu3DnlSyFChGQ
 RxRYsAG062QUprndrzz4afY6UZHqID78jHgR1ohlSYURu4it9+ogusklbua29VRjAFjYhkNQIhz
 461gFxx6CiGnt06LdNGEnSDk0mULhqmuOWkacVlBVzoR4UFjV7JRuA0o1oRiB0C5oTa3yAOu0vu
 J9rP7ct2NQoCXNMm22F7aFc3OQTRqoJhMbYiUW6EHvrVib4dnjZIbQlaoD+ALdT6D6Svq23cPrH
 5Mb3NCAfA0s8OGw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9325

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 194 +++++++++++++++=
++++++
 1 file changed, 194 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
index 395694583..14eade484 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -2001,7 +2001,201 @@ The following recipes have been upgraded:
 Contributors to |yocto-ver|
 ---------------------------
=20
+..
+   List obtained with the following shell snippet:
+
+      authors=3D""
+      for repo in openembedded-core yocto-docs bitbake meta-yocto; do
+         authors=3D"${authors}\n$(git --no-pager -C $repo log --format=3D=
"-  %an" yocto-5.3..origin/master)"
+      done
+      echo $authors | sort | uniq
+
+   Email addresses and duplicates removed.
+
 Thanks to the following people who contributed to this release:
=20
+-  Adam Blank
+-  Adam Duskett
+-  Adarsh Jagadish Kamini
+-  Aditya Kurdunkar
+-  Adrian Freihofer
+-  Alejandro Hernandez Samaniego
+-  Aleksandar Nikolic
+-  Alexander Kanavin
+-  Alexander Sverdlin
+-  Alex Bradbury
+-  Alex Kiernan
+-  Amaury Couderc
+-  Andrej Kozemcak
+-  Anibal Limon
+-  Ankur Tyagi
+-  Antonin Godard
+-  Ashish Kumar Mishra
+-  Ashish Sharma
+-  BELHADJ SALEM Talel
+-  Benjamin Robin
+-  Bruce Ashfield
+-  Changqing Li
+-  Chen Qi
+-  Clement Faure
+-  Colin Pinnell McAllister
+-  Corentin Guillevic
+-  Daiane Angolini
+-  Daniel Dragomir
+-  Daniel Turull
+-  Dan McGregor
+-  Deepesh Varatharajan
+-  Dmitry Baryshkov
+-  Dragomir, Daniel
+-  El Mehdi YOUNES
+-  Enrico J=C3=B6rns
+-  Ernst Persson
+-  Etienne Cordonnier
+-  Fabio Berton
+-  Fabio Estevam
+-  Favazza, Samuele
+-  Florian Schmaus
+-  Francesco Valla
+-  Germann, Bastian
+-  Gu=C3=B0ni M=C3=A1r Gilbert
+-  Gyorgy Sarvari
+-  Haiqing Bai
+-  Harish Sadineni
+-  Hemanth Kumar M D
+-  Het Patel
+-  Hiago De Franco
+-  hongxu
+-  Hongxu Jia
+-  Jaeyoon Jung
+-  Jan Luebbe
+-  Jan Vermaete
+-  Jason Schonberg
+-  Javier Tia
+-  Jiaying Song
+-  Jinfeng Wang
+-  Jo=C3=A3o Marcos Costa
+-  J=C3=B6rg Sommer
+-  Jose Quaresma
+-  Joshua Watt
+-  Kai Kang
+-  Kamel Bouhara
+-  Kavinaya S
+-  Ken Kurematsu
+-  Khai Dang
+-  Khalifa Rouis
+-  Khem Raj
+-  Koen Kooi
+-  Kory Maincent
+-  Kristiyan Chakarov
+-  Krupal Ka Patel
+-  Lee Chee Yang
+-  Leon Anavi
+-  Le Qi
+-  Liu Yiding
+-  Livin Sunny
+-  Liyin Zhang
+-  Logan Gallois
+-  Louis Rannou
+-  Lucas Stach
+-  Luka Krstic
+-  Mahesh Angadi
+-  Mark Hatle
+-  Markus Volk
+-  mark.yang
+-  Martin Jansa
+-  Martin Schwan
+-  Mathieu Dubois-Briand
+-  Matt Madison
+-  Maxin B. John
+-  Maxin John
+-  Max Krummenacher
+-  Miaoqing Pan
+-  Michael Arndt
+-  Michael Halstead
+-  Michael Opdenacker
+-  Michal Sieron
+-  Mikko Rapeli
+-  Ming Liu
+-  Mingli Yu
+-  Miroslav Cernak
+-  Mohammad Rafi Shaik
+-  Mohammad Rahimi
+-  Moritz Haase
+-  Naftaly RALAMBOARIVONY
+-  Naman Jain
+-  Nikhil R
+-  Niko Mauno
+-  Nora Schiffer
+-  Osama Abdelkader
+-  Patrick Vogelaar
+-  Patrick Wicki
+-  Paul Barker
+-  Pavel L=C3=B6bl
+-  Peter Bergin
+-  Peter de Ridder
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Peter Tatrai
+-  Philip Lorenz
+-  Pierre-Loup GOSSE
+-  Piotr Buli=C5=84ski
+-  Pratik Farkase
+-  Quentin Schulz
+-  Randolph Sapp
+-  Randy MacLeod
+-  Ricardo Salveti
+-  Ricardo Simoes
+-  Ricardo Ungerer
+-  Richard Purdie
+-  Robert Joslyn
+-  Robert P. J. Day
+-  Robert Yang
+-  Rob Woolley
+-  Ross Burton
+-  Rouven Rastetter
+-  Ryan Eatmon
+-  Sam Povilus
+-  Samuli Piippo
+-  Sandeep Gundlupet Raju
+-  Scott Murray
+-  Shaik Moin
+-  Shotaro Uchida
+-  Stefano Babic
+-  Stefano Tondo
+-  Sunil Dora
+-  sven.kalmbach
+-  Swami
+-  Telukula Jeevan Kumar Sahu
+-  Theo GAIGE
+-  Thomas Perrot
+-  Tim Orling
+-  Tom Geelen
+-  Trevor Gamblin
+-  Trevor Woerner
+-  Ulrich =C3=96lmann
+-  Uwe Kleine-K=C3=B6nig
+-  Veeresh Kadasani
+-  Victor Kamensky
+-  Vijay Anusuri
+-  Viswanath Kraleti
+-  Vivek Puar
+-  Vyacheslav Yurkov
+-  Wang Mingyu
+-  Weisser, Pascal
+-  Xiangyu Chen
+-  Yanis BINARD
+-  Yannic Moog
+-  Yash Gupta
+-  Yash Shinde
+-  Yasir Al-Latifi
+-  Yiding Liu
+-  Yi Zhao
+-  Yoann Congal
+-  Yongxin Liu
+-  Zhangfei Gao
+-  Zhang Peng
+-  Zk47T
+-  Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
+
 Repositories / Downloads for Yocto-|yocto-ver|
 ----------------------------------------------

--=20
2.53.0


