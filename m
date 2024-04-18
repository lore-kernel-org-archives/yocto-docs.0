Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D696DC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 18:28:03 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1504.1713464881815155774
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 11:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 0339C1232B;
	Thu, 18 Apr 2024 14:28:01 -0400 (EDT)
Received: from localhost.localdomain (unknown [24.75.208.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id AB6CD12196;
	Thu, 18 Apr 2024 14:28:00 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] variables: add USERADD_DEPENDS
Date: Thu, 18 Apr 2024 11:27:54 -0700
Message-Id: <1556a821aad0b0ff2886e72742284c9cee2457c0.1713464653.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713464653.git.bluelightning@bluelightning.org>
References: <cover.1713464653.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Apr 2024 18:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5165

New variable in 5.0.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 9cdcc1b61b..3f37f42f21 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9771,6 +9771,12 @@ system and gives an overview of their function and=
 contents.
       ``meta-poky/conf/templates/default/local.conf.sample`` in the
       :term:`Source Directory`.
=20
+   :term:`USERADD_DEPENDS`
+      Specifies a list of recipes that create users / groups (via
+      :term:`USERADD_PARAM` / :term:`GROUPADD_PARAM`) which a recipe
+      depends upon. This ensures that those users / groups are available
+      when building a recipe.
+
    :term:`USERADD_ERROR_DYNAMIC`
       If set to ``error``, forces the OpenEmbedded build system to produ=
ce
       an error if the user identification (``uid``) and group
--=20
2.25.1


