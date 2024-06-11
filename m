Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDE8C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 12:50:56 +0000 (UTC)
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
 by mx.groups.io with SMTP id smtpd.web11.8659.1718110246277544682
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 05:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=eJIUxiUJ;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.17, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1718110242; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=KKOYqbDBl2YDWayWLNtVG60om2xgxKVnUwxhdLSkFXfHXobKuRfhu6U3sETGL4lSKfIn+u9ekNkbsEnRKGMlrDziMrFaYn5qxkW7Wv6wU+JvKC6Z6nLcQ56izggyE3MVU/cGy0TIFWukd58Q+zEjWfEpa9h2u7rHho9mSSCdrHU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1718110242; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0YxAPO2SAn0qA9dbNrDxyqBhwdgswcaIQanyV9HQnfg=; 
	b=GlJUh7QJdDE1pnYwNMBRVfHqyi8r0KXVDFPMS0Iji8INiV7M7B1bQZPFOcZD1KVomkQWELSpcH7f6FfZq7tVle8dNZgnSCt5iNF6eyQ962R+fkjqUKmnGV5d3uBrxr/MuL0PWlL48t1HJA6gAFqq8Ve1Cbci7KGxtMdNfAwSSWg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718110242;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0YxAPO2SAn0qA9dbNrDxyqBhwdgswcaIQanyV9HQnfg=;
	b=eJIUxiUJsqAHaxh9BtpxaGrv9PDaVAv1ziVD+/39RuBEMWBom3kShw1WDssj1np7
	E581mWu8A4uZ8TsTcaMuVYWBjcWx9MPlC5SeOQ44rZHtQbN9hXzvcPlek75Q0r/DE8A
	DhBBvxuZjog9nXh2hdYyT4/gC83iIO8aPUV5O74I=
Received: by mx.zoho.eu with SMTPS id 1718110240855340.50309963512336;
	Tue, 11 Jun 2024 14:50:40 +0200 (CEST)
From: michael@opdenacker.org
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael@opdenacker.org>
Subject: [PATCH] documentation/README: refer to doc package requirements
Date: Tue, 11 Jun 2024 14:50:26 +0200
Message-ID: <20240611125026.22702-1-michael@opdenacker.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jun 2024 12:50:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5293

From: Michael Opdenacker <michael@opdenacker.org>

Refer to package requirements for building documentation
from supported distributions. The simple instructions
previously listed no longer work on Ubuntu 24.04, for example.

Signed-off-by: Michael Opdenacker <michael@opdenacker.org>
---
 documentation/README | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/documentation/README b/documentation/README
index b60472fcbf..c888b666a8 100644
--- a/documentation/README
+++ b/documentation/README
@@ -108,32 +108,9 @@ generated with DocBook.
 How to build the Yocto Project documentation
 ============================================
 
-Sphinx is written in Python. While it might work with Python2, for
-obvious reasons, we will only support building the Yocto Project
-documentation with Python3.
-
-Sphinx might be available in your Linux distro packages repositories,
-however it is not recommended to use distro packages, as they might be
-old versions, especially if you are using an LTS version of your
-distro. The recommended method to install the latest versions of Sphinx
-and of its required dependencies is to use the Python Package Index (pip).
-
-To install all required packages run:
-
- $ pip3 install sphinx sphinx_rtd_theme pyyaml
-
-To make sure you always have the latest versions of such packages, you
-should regularly run the same command with an added "--upgrade" option:
-
- $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml
-
-Also install the "inkscape" package from your distribution.
-Inkscape is need to convert SVG graphics to PNG (for EPUB
-export) and to PDF (for PDF export).
-
-Additionally install "fncychap.sty" TeX font if you want to build PDFs. Debian
-and Ubuntu have it in "texlive-latex-extra" package while RedHat distributions
-and OpenSUSE have it in "texlive-fncychap" package for example.
+To build the documentation, you need Sphinx and a few other packages,
+which depend on your host GNU/Linux distribution. Such packages are listed on
+https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host
 
 To build the documentation locally, run:
 

