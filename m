Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.3464.1614206436478947891
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Feb 2021 14:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=H921fBoU;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id AC58020B6C40;
	Wed, 24 Feb 2021 14:40:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AC58020B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614206433;
	bh=bIOFl+3O1h+jOnKAY5pId2cJjlkSMBhAXPuj92bntAY=;
	h=From:To:Cc:Subject:Date:From;
	b=H921fBoUB2vaeB5TX+tM4GW00xnu9gzkD5RSEmSvYIC+RoGjcowF7PNlimvMA/EDr
	 2dodcelhLeWxFOpep4KsBNO3RgwngsyIrqxdfM+fhN/Ii4NCjAj5dhesN/4ZqSA3oK
	 0e+VUDywVn5VFVRhua4DZAZAGbnXtptNwES4zgPs=
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] ref-manual: Add Az fetcher documentation
Date: Wed, 24 Feb 2021 15:40:25 -0700
Message-Id: <20210224224025.2531669-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 2cb37b6a2..7539dec9d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -270,6 +270,18 @@ system and gives an overview of their function and c=
ontents.
       ":ref:`Basic Syntax <bitbake:bitbake-user-manual/bitbake-user-manu=
al-metadata:basic syntax>`" section in the BitBake
       User Manual for more information.
=20
+   :term:`AZ_SAS`
+      Azure Storage Shared Access Signature, when using the
+      :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/b=
itbake-user-manual-fetching:fetchers>`
+      This variable can be defined to be used by the fetcher to authenti=
cate
+      and gain access to non-public artifacts.
+      ::
+
+         AZ_SAS =3D ""se=3D2021-01-01&sp=3Dr&sv=3D2018-11-09&sr=3Dc&skoi=
d=3D<skoid>&sig=3D<signature>""
+
+      For more information see Microsoft's Azure Storage documentation a=
t
+      https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-=
overview
+
    :term:`B`
       The directory within the :term:`Build Directory` in
       which the OpenEmbedded build system places generated objects durin=
g a
@@ -7103,6 +7115,8 @@ system and gives an overview of their function and =
contents.
=20
       -  ``npm://`` - Fetches JavaScript modules from a registry.
=20
+      -  ``az://`` - Fetches files from an Azure Storage account.
+
       Standard and recipe-specific options for ``SRC_URI`` exist. Here a=
re
       standard options:
=20
--=20
2.25.1

