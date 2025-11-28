Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D59D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18697.1764344120733290475
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=dPuY3XYZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3FBF91A1E09
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BE9060706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C7B910B02062;
	Fri, 28 Nov 2025 16:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XMxpaOU7Q+IJwcnasZn1LP6FQ7yfNgf9OXVfEk6idXs=;
	b=dPuY3XYZK6gTdTwmHZdbyPVRGEH+aZOfdq3vLo+tDXIWpAhCtr/9/HZcEnm5SfPSYXoeLK
	6viwrb3Fg0D0WAucBZyPQ5tfqtbKuxdEkob9V2OyW1RhIvkxN1HOG7OqLFRmdsXz2KvoAN
	UrL1J3elGCpstj8h593yJyXFkTh0M3Nu7bHErqOv2h6MwG1QoyHnT7C0wzTxvsgPiKv8LK
	bubqM82KvAYr4Saq9a6QdL/w4dXp7Cgc1mH1DpKl3bgA7p8E5WWpVzpEkoXHmTKj3Qo1l2
	G+aSQg2dwH/fSOPQdZjbxe4v7rWw+36nZhQ/ujSRkLfsgq+VgOQs5udRaUZj1A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:35:05 +0100
Subject: [PATCH 8/9] migration-guides/release-notes-5.3.rst: add
 contributors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251128-release-note-5-3-updates-v1-8-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5152;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=H9syxCDVnTNbiSX1wWSNGPglFbmIylQSgXrDPqknKeQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEvGv8PVtmlEr4ED0vtolYGzeDH80u4S9TXp
 BrzhSghfGaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLwAKCRDRgEFAKaOo
 Nt7lD/wOi1H5ZsXzOPJtDGV3s30HhNVN+vTec3B434Vg6wMAK5KSqjIIDd76IGqvJ0Cq51+6ZS7
 f14Y9vjaskhNHa+mRydS4SR6ptfYn3zlQ0yiaQXLDrr2noYoy8R7sraBeAajyv5+ShJYmTymp6H
 MyhydDjw8Y3vX+f029O4VgEM2ZeA2umuFfvQQYeR9Yxy9Y2x6Wl4lGZrwsU2+xNhNU8xCQ0b/mc
 LZ0j1FNcuB9er57eQFG7FjElNr/aQ7E0YUkfJEUqgzVi1xIEI3vE/wSPADWvWdnF0Ohf8updlS5
 fF1gRjLD/FLc3zPH2ahq5Z2liDvMnXNOxQjtj2MaIGl73ApeFbKlyJp/27o4zdodILG8lLfi/mm
 InJWvOOtBlMOnNsyE5LkXQcXVQHKK/bPIlY5E8Eia0H6eYlEkkp2LwT39zg1d/hpoqy74gwqWO+
 cw7AcPWXwUBew2KoOXHzWLxGhQ4YD/UxO7lp7QVSLpWXKEeTC2dfOzrDNomEZskAfcThjNGIT76
 AA4EvkAPLQTyzvRbLxTud6DoSPe54opTUWcDZ4hpFG6Q2k2JGbZ+WtdJC77xmI3Da+klqFYbZki
 K3Q8OMQ8rw7KAaToIdUYUl88vZnKtyWDcAxb9RhFhK87nCu74MHVVdDuvidxMugeFknGku5GuFx
 +Uka2slhe5fNw3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8171

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.3.rst         | 217 +++++++++++++++=
++++++
 1 file changed, 217 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/docum=
entation/migration-guides/release-notes-5.3.rst
index ef1a0b4fb..a7e989ced 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -2188,7 +2188,224 @@ The following recipes have been upgraded:
 Contributors to |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
+..
+   List obtained with the following shell snippet:
+
+      authors=3D""
+      for repo in openembedded-core yocto-docs bitbake meta-yocto; do
+         authors=3D"${authors}\n$(git --no-pager -C $repo log --format=3D=
"-  %an" yocto-5.2..origin/master)"
+      done
+      echo $authors | sort | uniq
+
+   Email addresses removed.
+
 Thanks to the following people who contributed to this release:
=20
+-  Adam Blank
+-  Adam Nilsson
+-  Adrian Freihofer
+-  Ahmad Fatoum
+-  Alejandro Hernandez Samaniego
+-  Aleksandar Nikolic
+-  Alexander Kanavin
+-  Alex Kiernan
+-  Alon Bar-Lev
+-  Alper Ak
+-  Andreas Stergiopoulos
+-  Andrej Valek
+-  Anibal Limon
+-  Ankur Tyagi
+-  Anna-Lena Marx
+-  Antonin Godard
+-  Anuj Mittal
+-  Archana Polampalli
+-  Barne Carstensen
+-  Benjamin Missey
+-  Benjamin Sz=C5=91ke
+-  Bo Sun
+-  Bruce Ashfield
+-  Carlos S=C3=A1nchez de La Lama
+-  Changqing Li
+-  Chen Qi
+-  Chris Laplante
+-  Christian Lindeberg
+-  Christos Gavros
+-  Daisuke Yamane
+-  Daniel McGregor
+-  Daniel Turull
+-  Daniel Wagenknecht
+-  Dan McGregor
+-  Dario Binacchi
+-  David Reyna
+-  Deepak Rathore
+-  Deepesh Varatharajan
+-  denisova-ok
+-  Denys Dmytriyenko
+-  Diego de los Santos
+-  Diego Sueiro
+-  Divya Chellam
+-  Dixit Parmar
+-  Dmitry Baryshkov
+-  Enrico J=C3=B6rns
+-  Enrico Scholz
+-  Erick Shepherd
+-  Erik Lindsten
+-  Etienne Cordonnier
+-  Fabio Estevam
+-  Falk Bauer
+-  Gregor Herburger
+-  Gu=C3=B0ni M=C3=A1r Gilbert
+-  Gyorgy Sarvari
+-  Haixiao Yan
+-  Harish Sadineni
+-  Hiago De Franco
+-  hongxu
+-  Hongxu Jia
+-  Ines KCHELFI
+-  Isaac True
+-  Jaeyoon Jung
+-  Jamin Lin
+-  Jan Vermaete
+-  Jason M. Bills
+-  Jason Schonberg
+-  Jayasurya Maganuru
+-  Jeroen Hofstee
+-  Jiaying Song
+-  Jimmy Ho
+-  Jinfeng Wang
+-  Jo=C3=A3o Henrique Ferreira de Freitas
+-  Joao Marcos Costa
+-  Jo=C3=A3o Marcos Costa
+-  Johannes Schneider
+-  Jonathan Schnitzler
+-  Jon Mason
+-  J=C3=B6rg Sommer
+-  Jose Quaresma
+-  Joshua Watt
+-  J. S.
+-  Julian Haller
+-  Kai Kang
+-  Kavinaya S
+-  Keerthivasan Raghavan
+-  Khang D Nguyen
+-  Khem Raj
+-  Koch, Stefan
+-  Koen Kooi
+-  Kyungjik Min
+-  Lamine REHAHLIA
+-  Lee Chee Yang
+-  leimaohui
+-  Lei Maohui
+-  Leon Anavi
+-  Leonard Anderweit
+-  Libo Chen
+-  Liu Yiding
+-  Li Wang
+-  Louis Rannou
+-  Luca Fancellu
+-  Madhu Marri
+-  Manuel Leonhardt
+-  Marco Cavallini
+-  Mark Asselstine
+-  Mark Hatle
+-  Markus Kurz
+-  Markus Volk
+-  Martin Jansa
+-  Martin Siegumfeldt
+-  Mathieu Dubois-Briand
+-  Michael Halstead
+-  Michael Jeanson
+-  Michael Opdenacker
+-  Michael Tretter
+-  Michal Sieron
+-  Mike Crowe
+-  Mike Looijmans
+-  Mikko Rapeli
+-  Ming Liu
+-  Mingli Yu
+-  Moritz Haase
+-  NeilBrown
+-  Nguyen Dat Tho
+-  Nikhil R
+-  Niko Mauno
+-  Ola x Nilsson
+-  Olga Denisova
+-  Osama Abdelkader
+-  Osose Itua
+-  Ovidiu Panait
+-  Patrick Vogelaar
+-  Patrick Williams
+-  Patryk Seregiet
+-  Paul Barker
+-  Paul Gortmaker
+-  Pedro Ferreira
+-  Per x Johansson
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Peter Tatrai
+-  Petr Vorel
+-  Philip Lorenz
+-  Philippe-Alexandre Mathieu
+-  Pierre-Loup GOSSE
+-  Poonam Jadhav
+-  Praveen Kumar
+-  Priyal Doshi
+-  Quentin Schulz
+-  rajmohan r
+-  Randolph Sapp
+-  Randy MacLeod
+-  Raphael Schlarb
+-  Rasmus Villemoes
+-  Ricardo Salveti
+-  Ricardo Simoes
+-  Richard Gr=C3=BCnert
+-  Richard Purdie
+-  Robbin Van Damme
+-  Robert P. J. Day
+-  Robert Tiemann
+-  Robert Yang
+-  Rogerio Guerra Borin
+-  Ross Burton
+-  Ryan Eatmon
+-  Samuli Piippo
+-  Sandeep Gundlupet Raju
+-  Saravanan
+-  Siddharth Doshi
+-  Simone Wei=C3=9F
+-  Soumya Sambu
+-  Stefan Eichenberger
+-  Stefan Koch
+-  Steffen Greber
+-  Steve Sakoman
+-  Talel BELHAJ SALEM
+-  Thomas Perrot
+-  Thune Tran
+-  Tim Orling
+-  Tobias Pistora
+-  Tom Hochstein
+-  Trevor Gamblin
+-  Trevor Woerner
+-  Tudor Ambarus
+-  Uwe Kleine-K=C3=B6nig
+-  Veeresh Kadasani
+-  Victor Kamensky
+-  Vijay Anusuri
+-  Vincent Davis Jr
+-  Vishwas Udupa
+-  Vivek Puar
+-  Vyacheslav Yurkov
+-  Walter Werner SCHNEIDER
+-  Wang Mingyu
+-  Weisser, Pascal.ext
+-  Yannic Moog
+-  Yash Shinde
+-  Yi Zhao
+-  Yoann Congal
+-  Yogesh Tyagi
+-  Yogita Urade
+-  Zhang Peng
+-  Zoltan Boszormenyi
+-  Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
+
 Repositories / Downloads for Yocto-|yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--=20
2.51.0


