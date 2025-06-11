Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27305C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 08:49:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.2959.1749631761379165944
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 01:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OeLi7Unm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jbWQGRzN4fReVMEbFqNM/c+uKZ2gDw24nGlaJw6s9Kc=; b=OeLi7UnmbvbuwY+fWoShOiUthl
	9i4OCPJUtfFwQ7WyUZFeQVdH4bDItcK4H/QHK78ZkRGzRJoesBhgno2cXa8lWHWxuWdi6vUiD0Z/2
	FDjnndpI0ecO7wSCNlkkiIwPXgRIf/WdOrZOwrJfDSAkx/lTKjBfn4t8GBhm4t32zCPdwg9ANZZxR
	/lCE9OLlFwiEiqV6jIvlknDiMrpHWD283rLt7IF2OLhFvV7cnkyUhNoJ0Vk5pfiPxbxE33U6b32fe
	g82xRILtY+oY+jpZjFZRmHzCwFUwNAejbIN6jCPZ0jjOnMgsRUyX9UxCrKlWTt2+o2vGCO2eE4P7T
	a5xYpJJg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:51096 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uPH90-0000000E5AW-2RZ6
	for docs@lists.yoctoproject.org;
	Wed, 11 Jun 2025 04:49:19 -0400
Date: Wed, 11 Jun 2025 04:49:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH][ref-manual] clarify definition of PROVIDES variable
Message-ID: <6686fc57-f92d-8c76-704d-ebc5046561a9@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 08:49:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7058


Correct the example used in the definition, and add a bit more detail,
including the use of both assignment operators.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5c18b852d..2d3af4966 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7411,21 +7411,25 @@ system and gives an overview of their function and contents.
       provides itself. If a recipe uses :term:`PROVIDES`, the additional
       aliases are synonyms for the recipe and can be useful for satisfying
       dependencies of other recipes during the build as specified by
-      :term:`DEPENDS`.
+      :term:`DEPENDS` without needing to be specific as to which package
+      provides that dependency.

-      Consider the following example :term:`PROVIDES` statement from the recipe
-      file ``eudev_3.2.9.bb``::
+      As an example, the term "udev" refers to the Linux subsystem for
+      managing device events. Depending on how you configure your build,
+      that functionality can be supplied by either the ``eudev`` package
+      or by ``systemd``, which is why both of those BitBake recipes advertise
+      that with the line:

-         PROVIDES += "udev"
+         PROVIDES = "udev"

-      The :term:`PROVIDES` statement
-      results in the "eudev" recipe also being available as simply "udev".
+      Those :term:`PROVIDES` assignments result in both the ``eudev`` and
+      ``systemd`` packages being available as simply "udev".

       .. note::

-         A recipe's own recipe name (:term:`PN`) is always implicitly prepended
-         to :term:`PROVIDES`, so while using "+=" in the above example may not be
-         strictly necessary it is recommended to avoid confusion.
+         Throughout Yocto Project recipes, you will see :term:`PROVIDES`
+         assignments using both the "=" and "+=" operators;
+         both forms are valid and have the same effect.

       In addition to providing recipes under alternate names, the
       :term:`PROVIDES` mechanism is also used to implement virtual targets. A

