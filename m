Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86885E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 15:36:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.35240.1735054566753794539
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 07:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fET4JI8i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BAD260005;
	Tue, 24 Dec 2024 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735054564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jZAPEqEJ+KMcrHWvjIJcm/hWxvXo+rkFujpcI91vJbA=;
	b=fET4JI8iKp3KEkSt0vvg7PhOJVZ8MoqkdKsx2DFdNb4am8tEsP8YFc9joQ2KxHQnS2puB8
	OiCrD10uUui5ECdj0pLtP9ZkKIb5wZIEXsDghf6++joxfxGz7wGhDIpoqgD+lxnF5ic0YM
	3T5z+kkDgQu8Mm+w6ipS219Nw2TfAHuAvKjXO82tKdNkZtVhOyRdF1x5j2bfMKeniHd9wV
	gb7glHeTMeBjnkkKQWnTfCFtTWVwBcmJf9WZw62Lk+rkcSuJixpfTOeyV0gn0WB+e81Ilv
	h1nRaoPjb2p6KCYvLNuebnUihGUXdxCojNXFAlLrHld/RMHz+lqbUJAwXzthGg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Dec 2024 16:35:55 +0100
Subject: [PATCH] SSTATE_MIRRORS/SOURCE_MIRROR_URL: add instructions for
 mirror authentication
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-sstate-mirror-user-password-v1-1-d33e424617be@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANrUamcC/x3MOQqAQAxA0atIagPOAqJXEYvBiZpCRxI3EO/uY
 PmK/x9QEiaFtnhA6GTltGaYsoBhDutEyDEbbGW9sdaj6h52woVFkuCRc9yC6pUkYlN7F0fT1ME
 R5MMmNPL937v+fT+HJquVbQAAAA==
X-Change-ID: 20241224-sstate-mirror-user-password-9743df197a3e
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 peter.zsifkovits@at.bosch.com, Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4966;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kc1qisLzdQhUYoGMqxu2XfmgyBhHFoIGzhpUEnYBJjs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnatTg+hf4dOPzrwilehFhJ3r2i3rsm2cAyXg1i
 Xb//8fJFO6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2rU4AAKCRDRgEFAKaOo
 NrHoD/9rJ+hy9G8mHoCkJwuhp++wed9EYTU4/iDZA8xCweB9CiQoRBTlXZh+OMLRr/wjeIuUbL8
 VBuoRw7ZzcCrPqnw3uNAdKrycBSC1ltx7nQrOOQCJZ/C+CdVtvAZG47VrwrsvuWbnRjTqyjZfn+
 w2sZN4EGf/p8U73DJo9mL+LoSSTW6m1cvFB9K0SN4vKVygI052eIxsPHLGW4HmVJpUIHa+QWYqi
 YbG/9CkuDhYJMwmhhvQxUfchWNJApHxsNucWXRHHSsqFNPXRTKqbhToZYYRAFYVvn0bW4ci2fS9
 JU8VOmzheCNdqdYzGf2vTvFYJYg2I7C02S8YnctimHOx8VU26QjlNYoe51fDSje2zcUOB/a2+o6
 Ds9mJ6R59ID8ks81ShBfOAKqAWawAOypiwydyQxNzsEpAnUQM7gybXbwIAeLPI67nxkfSaCdJgG
 CrywUVrJSlm1y6uQ7K5bQL7CXoWLpXFrGjITt1mfCUSHQQtrJuh4nRRa70sxGV3rpUu1I92JgWm
 6Nmja07nTFaJGukI/xLDr1Frw69aoMmMLd2CxskEcazAWW561wi+jpydudp+wrKjOvJ3XKfYUoi
 Gd1HkiwR1jHLT4sgYIgUgqDhFmI5O6VzajV0+6X1i41TXKSbiuqc7O4JsvhqaP31WMBzKlroqvP
 Pd3TRjQGyJJky6g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 15:36:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6024

[ YOCTO #15218 ]

There are different ways of configuring the build host when
authentication to a mirror (SSTATE_MIRRORS or SOURCE_MIRROR_URL) is
required.

Document these methods, and begin with the preferred approach which is
to edit ~/.netrc appropriately. When that is not possible, specifying
the credentials from the URL is also possible, so document it as well.

Reported-by: peter.zsifkovits@at.bosch.com
Tested-by: Antonin Godard <antonin.godard@bootlin.com> # Debian 12 container
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Tested in a Debian 12 container like so:

  $ mkdir downloads
  $ cp .../{bash-5.2.21.tar.gz,bash-5.2.21.tar.gz.done} downloads/
  $ pip install sauth # python http server with basic auth
  $ sauth username password 127.0.0.1

In local.conf:

  INHERIT += "own-mirrors"
  SOURCE_MIRROR_URL = "http://127.0.0.1:8333/downloads"
  BB_ALLOWED_NETWORKS = "127.0.0.1"

In bitbake's shell:

  $ bitbake bash -c cleanall
  $ bitbake bash -c fetch

As expected, error in log.do_fetch:

  Connecting to 127.0.0.1:8333... connected.
  HTTP request sent, awaiting response... 401 Unauthorized

Now, configure the following in ~/.netrc:

  machine 127.0.0.1
  login username
  password password

Try again: "bitbake bash -c fetch" runs successfully.

Remove ~/.netrc, replace in local.conf:

  SOURCE_MIRROR_URL = "http://127.0.0.1:8333/downloads;user=username;pswd=password"

In bitbake's shell:

  $ bitbake bash -c cleanall
  $ bitbake bash -c fetch

"bitbake bash -c fetch" runs successfully.
---
 documentation/ref-manual/variables.rst | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e8db89f8c9642b1e36c574e1369093a7a2ce30a4..88eda960d0f06307d483ecd9c2f6d1c9cc6920f4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8032,6 +8032,31 @@ system and gives an overview of their function and contents.
 
          You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
 
+      .. note::
+
+         If the mirror is protected behind a username and password, the
+         :term:`build host` needs to be configured so the :term:`build system
+         <OpenEmbedded Build System>` is able to fetch from the mirror.
+
+         The recommended way to do that is by setting the following parameters
+         in ``$HOME/.netrc`` (``$HOME`` being the :term:`build host` home
+         directory)::
+
+            machine example.com
+            login <user>
+            password <password>
+
+         This file requires permissions set to ``400`` or ``600`` to prevent
+         other users from reading the file::
+
+            chmod 600 "$HOME/.netrc"
+
+         Another method to configure the username and password is from the URL
+         in :term:`SOURCE_MIRROR_URL` directly, with the ``user`` and ``pswd``
+         parameters::
+
+            SOURCE_MIRROR_URL = "http://example.com/my_source_mirror;user=<user>;pswd=<password>"
+
    :term:`SPDX_ARCHIVE_PACKAGED`
       This option allows to add to :term:`SPDX` output compressed archives
       of the files in the generated target packages.
@@ -8439,6 +8464,34 @@ system and gives an overview of their function and contents.
              file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
              file://.* file:///some-local-dir/sstate/PATH"
 
+      .. note::
+
+         If the mirror is protected behind a username and password, the
+         :term:`build host` needs to be configured so the :term:`build system
+         <OpenEmbedded Build System>` is able to download the sstate cache using
+         authentication.
+
+         The recommended way to do that is by setting the following parameters
+         in ``$HOME/.netrc`` (``$HOME`` being the :term:`build host` home
+         directory)::
+
+            machine someserver.tld
+            login <user>
+            password <password>
+
+         This file requires permissions set to ``400`` or ``600`` to prevent
+         other users from reading the file::
+
+            chmod 600 "$HOME/.netrc"
+
+         Another method to configure the username and password is from the
+         URL in :term:`SSTATE_MIRRORS` directly, with the ``user`` and ``pswd``
+         parameters::
+
+            SSTATE_MIRRORS ?= "\
+                file://.* https://someserver.tld/share/sstate/PATH;user=<user>;pswd=<password>;downloadfilename=PATH \
+            "
+
       The Yocto Project actually shares the cache data objects built by its
       autobuilder::
 

---
base-commit: 28850c974a3896895bc921c094071523218d6d07
change-id: 20241224-sstate-mirror-user-password-9743df197a3e

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


