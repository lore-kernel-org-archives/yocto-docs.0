Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19887C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:32:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.24150.1748244726561487305
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=itLQDoHr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D3B543A65;
	Mon, 26 May 2025 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jMk93O7RxQCbheDznkD/RUKrUBfVaO0CKsTtz/81I7s=;
	b=itLQDoHr7Q7+aWeirmH8qvkfRI1QgR892ImWjJ6lNObM4ItTNNKsWas+qQsQHtjovEVG+j
	4KCIpwnehqwOnu8NnEaL5iSGOJ12CDgwhBCsJbw3ZEn/Pw+fjGd4dEnzuRRht6LThLfvlJ
	7GkEA04wpkk7SP7F/Xz+0jMlsFHESbnrCT9ynn2tvi4rHPfR/wY+xEIAAHx2kiQCVjW+fv
	jAjVOpaWZ7B4jWEJ6oQ9+pR9ZhMTvPCxi0DbLMqPCbTPH6nhDzXyCIQANNVapkWI3BXb9i
	Bt3ZHrrSiChGg+7o3geJ+hfqDGv5wHcbeqyWQhvfN1Z+G1hNY8lZQ6oZuZK6Dg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 26 May 2025 09:31:50 +0200
Subject: [PATCH] brief-yoctoprojectqs/index.rst: replace removed macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-fix-forgotten-macro-v1-1-1dad286539de@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOUYNGgC/x2MSQqAMAwAvyI5G+hiFf2KeCiaag62kooI4t8tH
 gdm5oFMwpRhqB4QujhzigV0XcG8+bgS8lIYjDJOOdNi4BtDkjWdJ0Xc/SwJrbVadao3XjdQykO
 oaP91nN73AwCHIGNlAAAA
X-Change-ID: 20250526-fix-forgotten-macro-333107092a14
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xKWZ67V42OKv/CZjrhmggCFnOULWFm1+WaebwG1Izpo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoNBjzAfB2NVt5plbVK9C5x1/YlLC/Nv7qTByyj
 mUXq09LfROJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaDQY8wAKCRDRgEFAKaOo
 NpBhD/9ONOA2blG8C0Xwbm0ufLLFhox1jDsLSs9TnloWNnvm9Fy4hltg1O+ELzyGAZzXQbNh0Pr
 i6G3Rscm5SH8/VDe7auiPnNsOxkfVBEPTjbdHGGdfXGozEhv3WoSxlXxAVaXp6RasrUdv3FofgG
 0Ms4dK6thH2GWg0TFW+xA/LaaWjZnKjln2H63zN+YfJq3hggySp0tXpot/3f+iX75o3Ox9mhU6g
 ntDtZg1Xz/+qMfaMQy5xyetO2dYJs6lARdRJMdnACtHzjSp7uE8NGQWrfJz4QrZ55D3KTZEFHO6
 0a3cXz07li6Zw33QetItyApuhOGf6ZvrrKG8Da/cXIOm6ZvFEvPEmokQC3v4co8S/5eOKyi0pV7
 2RZgR4LM1N/DkFl2y3yLythGOi2zV1md8Mzvk3jjIZVq3V218bx+Hf5czTokTffc9aouYsKwEGu
 p8sNJSBsuT2H639cK1UZIoX4tOfDPZxccBxcqsZhXxRWVn3WIk05Puz0vMFChe2MuIWGpT+kifD
 cfBs+3U7YCZUOcFmE0/YMf4ZKbqQ362QzyKjg/d0sAKyZu4LVxj5IUcTz1Tb2PsCOvukt/fGGny
 HnybaoWRw1/UaTwZMCvVa7GEsgHc8LkUZXPwaYaqKSt9ZhqQ1PjE+/KTKScOP0deGirR+r/P2Fc
 D7azd9DgbHnPi4g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeijeeltdeiueetffevteelueffiedvffejgfethefgheelieetheeiueeikeeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhpjhgurgihsegtrhgrs
 hhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6907

The UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL macro was removed after
8d993022c2ae ("docs: use literalinclude for system requirements").
Replace by the literalinclude like in the reference manual.

Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 070f5e2cf..48f81b16a 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -76,9 +76,10 @@ Build Host Packages
 
 You must install essential host packages on your build host. The
 following command installs the host packages based on an Ubuntu
-distribution::
+distribution:
 
-   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
+.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
+   :language: shell
 
 .. note::
 

---
base-commit: 3460177c46d360b0f2f852cdab23f21bd4ec6d5a
change-id: 20250526-fix-forgotten-macro-333107092a14

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


