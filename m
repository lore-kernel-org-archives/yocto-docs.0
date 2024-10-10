Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF04CF11EC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41793.1728562260730743111
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UF+INGxZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46ACBFF808;
	Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=US7fwVYHXKJUmyclJHHq29e7yo8qnZpq0FKzJbjoGcc=;
	b=UF+INGxZlR9kq86AXw+3GtWOYVh+1WsG6ztU/+oyA7KLLcmcE0SmA850wncDtzye8TYBCr
	A6k8nkFcD9TfS/p5CpfrBOjT5yg2vXthTkhHsA3pOidKnnKd4MP7OBIC5b2JFPE36/GP2u
	5tYLzlLlYgCLqZO7kM48JwZEU0O1cpz8d/6vIF3pe/XThKVTiN5lkqdJez1r2ffzw21cvS
	B8uZMPXrlIScvhxChhIMOsv8I3sTMIX1uIJzQapPQ/j4Vnf1F9EipkoHksiYP4n4afV6bi
	N9oyqyK35qZTQntvWmooy9+jo9RO/7NfE6uO6igIhiISbdCafDgeCqDSv2WOHA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:37 +0200
Subject: [PATCH v3 12/16] ref-manual: add missing variable PRSERV_UPSTREAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-12-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=o7eGbblc6F3orRKzVCiMbkSqbVGSzSX0w0WXOPRRK6g=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8ROyvE0wryiiw5Oo53V7K7vTChmleZk2Zm5I
 Ld4mCB8bUuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NhVLD/wIxbt7pba+ryWb250WipJkZLBovA1jrfwpoRwSDqTKZ3UG4cKLDFVaTgoBvIU8+El3jbb
 ueKj+oEH4IzCt5C/zUa2VGn3WuuGcRPed6j4lLlRhQ79YLSS4XEJ9UmwWm1TjzZZWs2FZPVxqvc
 s6rvxmQ/t6KBcaTv6D4zUDq344DpiQjqqG691TlvwIJSGFueNLH3A+sswmztkMtv5ki7kH2ZoYk
 2OU44uyCZLVWnNia8MSu+l94JMjcahgAuQW5AjCs9XO3L76Jqz7LchFOOAIXhUYWF4TH3iVMxXS
 y4ceRadTh+mTOJCrDn1goKm7wQLGCRzV8tY6HGca74pqZiPayC4CzGt01ZOAzDSzZuMY1AGZNgY
 P1QqoKqNGI9/Ydc+BNgNEP95N1KXvu5Y4GwCndsFIkih97NMTWRwujySxffUgAiMCKU18LirWYP
 1+1Fxxjx+QcH+SO+InNiz24QWeOnBc/nCj/jtEJLKhdckUH1t7Ri7hb0QlsDchwAfw2fwrjN/4K
 XYceKNt2QmhIeIPeq9OjLNlWc39Jf3ls/tZGaia8+NKFyhOBgwpocFCXe3F0Euh2Pm9SE8+cWxj
 ReALrkPEa+z3ZFRgCWwfVDa/tQcA0Hpvdxt6QTuebJPDWCTzu8ojFDnfAZ6boyexkD/T+J4K2Hj
 4VyheXQGbAZhHeQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5464

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cb082cbdb..0d2d255ed 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6878,6 +6878,11 @@ system and gives an overview of their function and contents.
       service <dev-manual/packages:working with a pr service>`. You can
       set :term:`PRSERV_HOST` to other values to use a remote PR service.
 
+   :term:`PRSERV_UPSTREAM`
+      This variable can be used to specify an upstream PR server for the local
+      PR server to connect to, in the form of ``host:port``.
+
+      This makes it possible to implement local fixes to an upstream package.
 
    :term:`PSEUDO_IGNORE_PATHS`
       A comma-separated (without spaces) list of path prefixes that should be ignored

-- 
2.46.0


