Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE03FC037F
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:29:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16701.1777019349674353697
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Qv6j+/lH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 136EF4E42AE9
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFE67604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 651571072073B;
	Fri, 24 Apr 2026 10:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=En+EIQ2BRFxohLXyPHrb7J3tyKOiFua4khxVlLn7abA=;
	b=Qv6j+/lH5MHRqagmmZt/pk4ppzUrPZulfMg/RSYFj4coVZRWs8MNUuGkcGA/2FaqzYgDmf
	PfQn4n9lHRtpuyi40o++mhY/1Emdp7nvdi64tRMc6ZW/kz6uSx6CbocguCn1Pl9V8rHIk8
	XnVlmQmUHQqa91i6aAGHsu7yQdJ0PSKAfLq0ON6h8bi4R0kNozMqJUcrvzAPOhb+3OGPg1
	Rrmq3GGh/XDV5j3OrMNgaRTqmFfLbovKOtksqStxOCvm8w4Ob1eEwK1n+IdjrVFf79YoDl
	gBdfgwzDEcdVsjxRIX2ysIiuYdKxCDZ51fTv8gP2U9MUHyfzoXhfzHzl6psXDA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:45 +0200
Subject: [PATCH v2 17/18] migration-guides/release-notes-6.0.rst: add
 contributors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260424-third-release-notes-6-0-v2-17-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4748;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SNGoCKNKevnwcGZeeZSmyAQtuNm5hYqo4L9MFNwn80g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ynAlaCvm8Ex0/597i9pqzLNPlzo2puI6B54A
 u5/QfYCgyiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespwAAKCRDRgEFAKaOo
 NiShD/wMfGVi9XOBH20AGxAKGaY4vKiy8g9LbPwe00jq7HfvOrD3LScKjzum0dUNFgDa9W/3MaS
 vyrAfmoK7+4LAvP5ZbhkuT0aGEXZqjIrUTPqCGFzaZWMlO2JqvN8YELDbRcgcT5CmtQJMy0ijyA
 uqGvkXbNPJid0yO64xLmw8FvlvLWJhIQ70/WrG6x9GgcSIk6RYyWEVMqPPZ1PQ/c8rymOMvZ0Lx
 ztqiQY/8LEr8kpRb61tT1vNQU/NRcTyWHjebf+iRWmo1ZS7/gWbDMZPHAD8wzVoYy8CS2x/rpC5
 4ykyB7/zoblstkLOZ3RQxzsreOk/3TVi0kfD9Fgk7vHQVrJe1+KbUmArZ+9ho8xxEw3pFk8cQrC
 5Vup8Aat87wvwFA7DWHWlFXo4+flTWcCzD4a4fuK7obU++IBNoMtfjPhNxGriUFSjejEL1AqHg+
 uoDOq8mqpLTeMcYZvvJyMkL0m3QzlmY0kC//x8fy8F0HxC5XioPcwGGEfgYGHQhAXOgqygVejw/
 yOhcEXdkBpi4qokh/ByHmhe/jMzwrPq3KsFFRn4xJMOotE2DX07JDAUWruje/wluh34WymmAPjH
 CiTX6U9eWdn6xMCJlbmVuDwe/XruuohVn+0NPE2X9DCsXlW+DgDmAbwI4smjc1+AOdbNZN69pmV
 WhkhZ0a2zrmHmxw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9355

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 199 +++++++++++++++=
++++++
 1 file changed, 199 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
index 8f09223d0..f93075d7a 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -2020,7 +2020,206 @@ The following recipes have been upgraded:
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
+-  Ahmad Fatoum
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
+-  Franz Schnyder
+-  Germann, Bastian
+-  Gu=C3=B0ni M=C3=A1r Gilbert
+-  Gyorgy Sarvari
+-  Haiqing Bai
+-  Harish Sadineni
+-  Hemanth Kumar M D
+-  Het Patel
+-  Hiago De Franco
+-  Himanshu Jadon
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
+-  Mark-Pk Tsai
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
+-  Yann Dirson
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


