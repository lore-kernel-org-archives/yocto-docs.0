Return-Path: <matthias@pritschet.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D337BC3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 21:10:51 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.219])
 by mx.groups.io with SMTP id smtpd.web10.24276.1720991449809786753
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Jul 2024 14:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0002 header.b=nISomCUc;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0003 header.b=JwYBBl96;
 spf=none, err=permanent DNS error (domain: pritschet.eu, ip: 81.169.146.219, mailfrom: matthias@pritschet.eu)
ARC-Seal: i=1; a=rsa-sha256; t=1720991447; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Veq0N0S4m6M93tbBH8kWIy1/vjds3aTYP10qHYOAIcSL7BY8InzrEvNaPhwnyZ7rOp
    X6vU6du0sQbvlhCSAetE6uHWPjoeVa7ur1oxm72n+vIUGgRh5Ly5V9APW8KbNZV8JH7I
    Xslap1IRJeV7UHnj37Cw7Sb37kFgauiqgce+jqY2gqUQjhC4nA0KL4tt4hjL23ZtZb2B
    QX1y5UYwwmW7UX8t/BYHCntt/uni7PkIhJMB6xWOkP3p4M/IrzohmiWuSsKb+3Jf55rJ
    7m6mpA7skEIZ1yC+3AOScjtAXL7+FcEAn89udErDbFOTRYHcacg05sio9cinOjrpSJRp
    Cz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720991447;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=S6+asHYkQBGeS+1pAieWz0RzDfjifBBwEITlNVOKdVM=;
    b=T4jpV3PuCPN64FZFC/4SUwJHe2Xjv72DMoLHkH/+4nJF8S8+EfbCX3MemtrAC5FlRk
    tZ/ZmWvD0IWRUtETw/WOYyJeABeA1vaM/pYc3y3CpaAFkRwvr06JoeAiUt3/0FhfTQbq
    OqITDQjWGRBof9Tbm+t5NkRaAqDpBhIWqj2XqfPwZozAjIEoCKEF7lvprc7WT1hciTBf
    boCJoldqLoLNB9aSaRnGynUQf7wAAAuG/9aJgRSJ+HxKykqi8jzediMoWEJbDD24uVvT
    krYHAPshTNpyozwaI/GzWY+sf75UfaHiP6o2hEud/Eiqe4u/a/B0ZbrMuIW4oDLcjAEU
    YFvw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720991447;
    s=strato-dkim-0002; d=pritschet.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=S6+asHYkQBGeS+1pAieWz0RzDfjifBBwEITlNVOKdVM=;
    b=nISomCUck4rOC8x04ej6B+hWIIcGj23ekeU2ZRTTz1lvHhDk3VrUq3cxX6SM4hLkbF
    hYWPWdwbCUwmd5KS1MqsOKIB0wo/DY1h52/cIT/q+nR2fw7aBlmcg2IUAWwRtDdGXk2t
    JSf1isc5pm2ThVeLR1wrNbg4zYR19DF0QWs5XQzje5kxxXgtKuSYwvc/gZDxgW26mzy8
    L85OgKZKzFj6Dh5titxtWR9x2wyXDNx9KOPdINJ9y4qO36kyhLrzmI+4ZlRMGSvRc6hA
    pRCnVHN9MpNLA4/OYQi2FyH4TAiLxium6HR1NAjuXwdUTnykHI6rz4aLcCYtXQTHrvYv
    lb0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720991447;
    s=strato-dkim-0003; d=pritschet.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=S6+asHYkQBGeS+1pAieWz0RzDfjifBBwEITlNVOKdVM=;
    b=JwYBBl96kw7tbS5BhfTwLVAyXYUVk5hwiF+SfPIDVTx0LG2UTubq9UabidArFbezRi
    e4LW0+IJu1iTNmbGHIDA==
X-RZG-AUTH: ":IW0QYUiheuxX18P29qqHt/qCfjagLCCd1qyzKexpZQ1pd0swCVIOltsc1MIZTqzgk3mlAcYT1XBzIKR0OkfMZXapXN+ozls1/CpCFV/zVmM7HA=="
Received: from nibbler.fritz.box
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id Yd513e06ELAl7QH
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 14 Jul 2024 23:10:47 +0200 (CEST)
From: Matthias Pritschet <matthias@pritschet.eu>
To: docs@lists.yoctoproject.org
Cc: Matthias Pritschet <matthias@pritschet.eu>
Subject: [PATCH] ref-manual: fix typo
Date: Sun, 14 Jul 2024 23:09:08 +0200
Message-Id: <20240714210908.3964010-1-matthias@pritschet.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Jul 2024 21:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5312

changed one letter (s/B/A), so the sentence is correct again.
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 848cea787..3709fca89 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8618,7 +8618,7 @@ system and gives an overview of their function and contents.
          is just to show the usefulness of setting :term:`SYSROOT_DIRS`.
 
       When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is in
-      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
+      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``A``
       into ``B``'s :term:`SYSROOT_DESTDIR` that is "``${WORKDIR}/sysroot-destdir``".
 
       Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS`, it will never be copied to
-- 
2.34.1


