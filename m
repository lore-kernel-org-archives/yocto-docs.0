Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72134C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:56:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.4582.1744192565786600314
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 02:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GEUHz7Qh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C432442E8;
	Wed,  9 Apr 2025 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744192564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u4CujGdL5t/F+NmYZvTxxs4/kKwKLO3gZDnp3s3InfA=;
	b=GEUHz7Qh5VASD+PiioifdYOSEqCwgY7GhNI4cLOLir3r/ysWyopKg2+zpEolmGgAtJEW4B
	hNtvHAY/7GFDcyyN5W1/iOE/9MdI0c2ERmVgJJQwJoo6Ekg7pjiREkNJZXahH8K8rLuA7S
	dxjDo0I176YViNXW8Q/o10zNkbTgGuVQ3Uvih3L+p+DTwTanP2pjcKNJJhew+1M2sBhYJ4
	4F8hB6dflQfqDkL8Eo7zvrcszwluWTs06DPTm+q6wRHcwP14wA4RAf76uHKOWiQXfFLaxy
	BuYWQJbOqP8JXCE3+Ic/1VwMnCU/LjYcrFDeU5g/eVYRSol6qIQ28Cn+OUqAsg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Apr 2025 11:55:41 +0200
Subject: [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
In-Reply-To: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Uy5y4YL94haRP2ExEadGrkxyPFUjofAQZ6+NaIs/ENU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn9kQzjrBXatoZJye8t3n2UgPFix24Hny36r8Cz
 PvYI6EfZrmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/ZEMwAKCRDRgEFAKaOo
 Ns1DD/sHd8ylYqq91i9TJke9o/LiAXTRnq9XoEUdCH2JZ0b/ANSS6rVuQZvQ3rJRkaGgUxLZBXa
 ZF8r6iwyTDMWPKiCQq2HPBfnhFCYDmVqfP13YnUcX3g4PU6Lxp11x5CANINS0dx2W82bWoYEnDY
 cuMy4T1xzBOa2ZHzubo5s+DgshB3vtU7f2jbc+bOF1O6MTdo1dxB2yzGqaJyGfQmUovDV2yydUD
 S7ZTgtzBDudnrrV4HWyyzqJDGwt4KL2vC3q+DWT/3F3S9cOgy6JsRdqA8ARkp0/phpsn2eySkL2
 3H85WwGe28OmkkLNn96M4hOFkJs0Xz/UFEZt9Ne9MJXQBSEOlnCHJF+8nEPcoCC8yLX8LzdKWBT
 6WEFfe5koF85OzcVwoAZaZB2GodbpZy31cc2bDD9JfMixGOnlwjkL6lr29MWMHnWyz2aDczpuOj
 6XRk3iqHluVai42fB0GXwDBU7nwtkoWpGnhpuFCAMk6SfD2bkvp8jUeB9Cf6YIhwzq27WSi04LM
 XIRWDsbU6O+Ea68rQzL6rO5fUBHYRC1w1CXfnu3l+juDhMYUVF1uoEUJdae2ttiz/L1yVapJ+kY
 6ssb6Ho7pqZpRDZGusDAjQ+06gi6UspuU+2zvxs+C1SMHPdB4IHt8KDH6V5uXyDYvGwXsKxdIyt
 BAjVjWScQDnNC+A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkeegvedtfeehiedtteevgeduvdfhueeiveeujeduuddugfdujedtkeehieffhfenucffohhmrghinhephigrmhhlrdhinhdphhhtthhplhhinhhkrhgvfhgvrhhrihhnghhtohhthhgvtghurhhrvghnthguohgtshhvvghrshhiohhnrdhinhdphihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Apr 2025 09:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6722

Introduce the DISTRO_LATEST_TAG macro, which should always point to the
latest existing tag in the documentation, unlike DISTRO which may point
to A.B.999 to represent the tip of a branch.

This variable is needed to fix dead links in the documentation that
currently use the DISTRO macro.

Also, make DISTRO_REL_TAG use the DISTRO macro directly, to avoid
repetition, and add a DISTRO_REL_LATEST_TAG macro that has the same role
as DISTRO_LATEST_TAG but with "yocto-" prepended to it.

In set_versions.py, run the "git describe --abbrev=0 --tags
--match='yocto-*'" command to get the latest existing tag on the
currently checked out commit. Fallback to ourversion in case we didn't
find any.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in    | 11 ++++++++++-
 documentation/set_versions.py | 16 +++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 836f11454..26c21e346 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -2,13 +2,22 @@
 # Macros used in the documentation
 #
 
+# The DISTRO variable represents the current docs version. It should be used
+# when referring to the current docs version. See also DISTRO_LATEST_TAG.
 DISTRO : "5.1"
+# The DISTRO_LATEST_TAG represents the latest tag on the current branch. It
+# should be used in HTTP link referring to the current docs version. In these
+# cases, the DISTRO may point to A.B.999 which does not exist (just used to
+# represent the latest HEAD revision on the branch). DISTRO_LATEST_TAG should
+# always point to an existing tag.
+DISTRO_LATEST_TAG : "5.1"
 DISTRO_NAME_NO_CAP : "styhead"
 DISTRO_NAME : "Styhead"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "scarthgap"
 DISTRO_NAME_NO_CAP_LTS : "scarthgap"
 YOCTO_DOC_VERSION : "5.1"
-DISTRO_REL_TAG : "yocto-5.1"
+DISTRO_REL_TAG : "yocto-$DISTRO;"
+DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 5c55f470d..b94a7daad 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -170,17 +170,29 @@ series = [k for k in release_series]
 previousseries = series[series.index(ourseries)+1:] or [""]
 lastlts = [k for k in previousseries if k in ltsseries] or "dunfell"
 
+latestreltag = subprocess.run(["git", "describe", "--abbrev=0", "--tags", "--match", "yocto-*"], capture_output=True, text=True).stdout
+latestreltag = latestreltag.strip()
+if latestreltag:
+    if latestreltag.startswith("yocto-"):
+        latesttag = latestreltag[6:]
+else:
+    # fallback on the calculated version
+    print("Did not find a tag with 'git describe', falling back to %s" % ourversion)
+    latestreltag = "yocto-" + ourversion
+    latesttag = ourversion
+
 print("Version calculated to be %s" % ourversion)
+print("Latest release tag found is %s" % latestreltag)
 print("Release series calculated to be %s" % ourseries)
 
 replacements = {
     "DISTRO" : ourversion,
+    "DISTRO_LATEST_TAG": latesttag,
     "DISTRO_NAME_NO_CAP" : ourseries,
     "DISTRO_NAME" : ourseries.capitalize(),
     "DISTRO_NAME_NO_CAP_MINUS_ONE" : previousseries[0],
     "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
     "YOCTO_DOC_VERSION" : ourversion,
-    "DISTRO_REL_TAG" : "yocto-" + ourversion,
     "DOCCONF_VERSION" : docconfver,
     "BITBAKE_SERIES" : bitbakeversion,
 }
@@ -318,3 +330,5 @@ with open('releases.rst', 'w') as f:
             if tag == release_series[series] or tag.startswith('%s.' % release_series[series]):
                 f.write('- :yocto_docs:`%s Documentation </%s>`\n' % (tag, tag))
         f.write('\n')
+
+

-- 
2.47.0


