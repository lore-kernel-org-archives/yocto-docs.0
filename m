Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D843C36013
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10714.1743167255973912280
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dvY0YPlC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 575D9441A5;
	Fri, 28 Mar 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9M1XdbWh2yjAOA6/RQpDbRie+cO/s0ZrMGof3UMogc=;
	b=dvY0YPlCLQOsPP7XYMfrVArLttwKBvV/4fS8ePDf1M+yABw8XqJ/gPL6XQPvn7SuRqe9pt
	gsInuk7ycN3Vvb68qmdJJKkQCJxtXBSR/eIXvhnPnyAzPvB3xL3ft+s1GMmokubAJlT1xM
	i96KthCGVC4/Wah2zv0ErLzQtRHX0/XYhOky2khe9blj4prDP/zGYNiO/n6xZ4fYW0qREZ
	z5dNIafq2tFLmejAgsTVQZXF80BCaPPLC1ej6KJLlFesXdoAT6bKiLKiHdljN5ckttv2iH
	3/PW9qASHUYI7q064G+6M3hNOz8zNABX+5baB6+kZQTnboDEf1Hu1wY3FOR+KA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:04 +0100
Subject: [PATCH 01/11] migration-guides/release-notes-5.2.rst: add the list
 of contributors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-1-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4664;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=icNEtyTojs6wapdA1Pma05QEWKpVHAm2qzz+JjcNUlk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8Ub6XqEID/ZEHajiFDNcsvuns3aQx6LgRE8
 6niVYYYBWaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFAAKCRDRgEFAKaOo
 Nq32EACJKAaD2XZ5aC9+lyCX3uXakAdKWP0/IO5HLcMf9JxmJqvwti6/z5anNp4EtprawyUgDbU
 64kXoBI38tJ+6oQMs5sTaLn4WgpE7z4yIz0RlCSi5UYM8JY7t3QGDxioD3l4esOPLWz/8nUB0d6
 ZMSb07xovGtgYN2qz15TTLVlf8onRNGJEveUbvukTpx2xiAgH7jvLKJ/SgjFx5Q7gP83uoGVlRX
 SFHMd0YM7HpmanU6Vvc/7lEdnwuzgZgGqJsftQo9sh8e1Cho1QbLQTD50lvLIk6/eGFH8j35JlD
 7Snri17GhB8a9G2Qr+Zk24zVrY/gh8DR5Rmix+8zL1xyr8ThuPFzI0IzqEU2WGJiJHCcj+5I6WQ
 XkWveRW4UDIT4r0nDOc6XGvJ3DvN4kyxw+WP2ntQITtBQYS2rM24tAHUe5SZ34l/QDvAXO6ZNUf
 PW0diYcyUnEvRRRaFsG5VGiXmnzx4GE0k5XGdhHUrj2PQbClKBLu5oduObDGoa4SiFIJzyfqgr5
 AKT9BrIQbPOX0eXcWAEql1GWpoXtQug9bB2ESGUfYICjJT05OTXUmJstuc9f16YwcT0pHEVacC/
 EbPGnPrY+nP+um6rv8fRSfqB5Q3kR1h0Z3dUxeceFufGGzaG2RTtLIAjjNO1HAC7Bzq/KOtityn
 JmiWrfbLNxYO9sw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhveeileeitdeufeefvdegueeijeeigfeujeffgfevgeefleduveffieeggeeifeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6655

Obtained by running:

  git log --format=%an yocto-5.1..walnascar | sort | uniq

On the Poky repository.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.2.rst         | 193 +++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index a8e6e2b6e..923d3809a 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -715,5 +715,198 @@ Recipe Upgrades in |yocto-ver|
 Contributors to |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+Thanks to the following people who contributed to this release:
+
+-  Aditya Tayade
+-  Adrian Freihofer
+-  Alban Bedel
+-  Aleksandar Nikolic
+-  Alessio Cascone
+-  Alexander Hirsch
+-  Alexander Kanavin
+-  Alexander Sverdlin
+-  Alexander van Gessel
+-  Alexander Yurkov
+-  Alexandre Marques
+-  Alexis Cellier
+-  Alex Kiernan
+-  Andrej Valek
+-  Angelo Ribeiro
+-  Antonin Godard
+-  Archana Polampalli
+-  Artur Kowalski
+-  Awais Belal
+-  Balaji Pothunoori
+-  Bartosz Golaszewski
+-  Bastian Germann
+-  Bastian Krause
+-  Bastien JAUNY
+-  BELHADJ SALEM Talel
+-  Benjamin Bara
+-  Benjamin Grossschartner
+-  Benjamin Szőke
+-  Bin Lan
+-  Bruce Ashfield
+-  Changhyeok Bae
+-  Changqing Li
+-  Chen Qi
+-  Chris Laplante
+-  Christian Lindeberg
+-  Christian Taedcke
+-  Christos Gavros
+-  Claus Stovgaard
+-  Clayton Casciato
+-  Colin McAllister
+-  Daniel Ammann
+-  Daniel McGregor
+-  Dan McGregor
+-  Deepesh Varatharajan
+-  Deepthi Hemraj
+-  Denis OSTERLAND-HEIM
+-  Denys Dmytriyenko
+-  Derek Straka
+-  Divya Chellam
+-  Dmitry Baryshkov
+-  Enrico Jörns
+-  Enrico Scholz
+-  Eric Meyers
+-  Esben Haabendal
+-  Etienne Cordonnier
+-  Fabio Berton
+-  Fabio Estevam
+-  Gaël PORTAY
+-  Georgi, Tom
+-  Guðni Már Gilbert
+-  Guénaël Muller
+-  Harish Sadineni
+-  Haseeb Ashraf
+-  Hiago De Franco
+-  Hongxu Jia
+-  Igor Opaniuk
+-  Jagadeesh Krishnanjanappa
+-  Jamin Lin
+-  Jason Schonberg
+-  Jean-Pierre Geslin
+-  Jermain Horsman
+-  Jesse Riemens
+-  Jiaying Song
+-  Jinfeng Wang
+-  João Henrique Ferreira de Freitas
+-  Joerg Schmidt
+-  Jonas Gorski
+-  Jon Mason
+-  Jörg Sommer
+-  Jose Quaresma
+-  Joshua Watt
+-  Julien Stephan
+-  Justin Bronder
+-  Kai Kang
+-  Katariina Lounento
+-  Katawann
+-  Kevin Hao
+-  Khem Raj
+-  Koen Kooi
+-  Lee Chee Yang
+-  Lei Maohui
+-  Lei YU
+-  Leon Anavi
+-  Louis Rannou
+-  Maik Otto
+-  Makarios Christakis
+-  Marc Ferland
+-  Marco Felsch
+-  Marek Vasut
+-  Mark Hatle
+-  Markus Volk
+-  Marta Rybczynska
+-  Martin Jansa
+-  Mathieu Dubois-Briand
+-  Matthias Schiffer
+-  Maxin John
+-  Michael Estner
+-  Michael Halstead
+-  Michael Nazzareno Trimarchi
+-  Michael Opdenacker
+-  Michelle Lin
+-  Mikko Rapeli
+-  Ming Liu
+-  Moritz Haase
+-  Nick Owens
+-  Nicolas Dechesne
+-  Nikolai Merinov
+-  Niko Mauno
+-  Ninette Adhikari
+-  Ola x Nilsson
+-  Oleksandr Hnatiuk
+-  Oliver Kästner
+-  Omri Sarig
+-  Pascal Eberhard
+-  Patrik Nordvall
+-  Paul Barker
+-  Pavel Zhukov
+-  Pedro Ferreira
+-  Peter Bergin
+-  Peter Delevoryas
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Peter Tatrai
+-  Philip Lorenz
+-  Priyal Doshi
+-  Purushottam Choudhary
+-  Quentin Schulz
+-  Ralph Siemsen
+-  Randy MacLeod
+-  Ranjitsinh Rathod
+-  Rasmus Villemoes
+-  Regis Dargent
+-  Ricardo Salveti
+-  Richard Purdie
+-  Robert Yang
+-  Rohini Sangam
+-  Roland Hieber
+-  Ross Burton
+-  Ryan Eatmon
+-  Savvas Etairidis
+-  Sean Nyekjaer
+-  Sebastian Zenker
+-  Sergei Zhmylev
+-  Shunsuke Tokumoto
+-  Sid-Ali
+-  Simon A. Eugster
+-  Simone Weiß
+-  Slawomir Stepien
+-  Sofiane HAMAM
+-  Stefan Gloor
+-  Stefan Herbrechtsmeier
+-  Stefan Koch
+-  Stefan Mueller-Klieser
+-  Steve Sakoman
+-  Sunil Dora
+-  Sven Kalmbach
+-  Talel BELHAJSALEM
+-  Thomas Perrot
+-  Thomas Roos
+-  Tim Orling
+-  Tom Hochstein
+-  Trevor Gamblin
+-  Ulrich Ölmann
+-  Valeria Petrov
+-  Victor J. Hansen
+-  Victor Kamensky
+-  Vijay Anusuri
+-  Vince Chang
+-  Vivek Puar
+-  Vyacheslav Yurkov
+-  Walter Schweizer
+-  Wang Mingyu
+-  Weisser, Pascal
+-  Xiangyu Chen
+-  Xiaotian Wu
+-  Yash Shinde
+-  Yi Zhao
+-  Yoann Congal
+-  Yogita Urade
+-  Zoltán Böszörményi
+
 Repositories / Downloads for Yocto-|yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
2.47.0


