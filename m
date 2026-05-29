Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602E3CD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 17:01:43 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58.1780074094784103695
 for <docs@lists.yoctoproject.org>;
 Fri, 29 May 2026 10:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z4nNxaly;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13643f6d1a9so5040233c88.0
        for <docs@lists.yoctoproject.org>; Fri, 29 May 2026 10:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780074094; cv=none;
        d=google.com; s=arc-20240605;
        b=Fye9snLj4Sevf9NeX+uNmWj/u8+v/UUEf0LgNb+eilMx5T34KqSBt+OOzoADSE4Ovb
         2H+0S308TN2TAVIYz60G4fUx+bbPnwIHmTtehLw7pYFqLDxRoYQ+Diq53ItKe88++Niu
         5YMabhkoO4dV0PMxPfAsf7hHC817zrR9APlUr69vJWNipEcXSjgEkKl1tZAsp6hVDRQI
         snD8GtVdLaQAYvuhNrcYpe/dSG7HAHJmJz+Cta5ZRYxI/jAi/M37N0MugPLK9qphVpG9
         N1pHztfbmmbG+E0wZ4+47OYqaPTxxdJhVLC23GXxFG8CdzGocI0K40syjXRtJloDNfsI
         S0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jo9vdvnpP/dC2LtU7WORLK5XbIFaK1m3SK7VhetHHiU=;
        fh=fkwYVRm+nfqGUJzMaAXAuxy1kLEEnAaXOeZRsofUhXc=;
        b=G0f3CxoImi7a+gvAxchwZGu0NFdMZae107Vn3uBU5sm7r3bXOnsui03TklLBVloExp
         Yh047Hve9lTPwOBYznn4/ksCuf0DxvvyqWj4rLIH9enjIsCdTom4kxLurU0BNnh+0USD
         XAfh5nSn6DSaDKR0XnX7JZOJfiBmTB+QzqqKBWTR3szrecd3x5fqWNs3sxRu7j/0BpES
         AyEGPXlZlXeF3zAjUpyGkrzn2Gywlytummr8wLGC5XJjrZLka043st2zFfpWf+ujXgOS
         AuGoSS3bv7A1+pt8c3H2IJ9ws1uAh9fmzFkkZEsplwqJByCZoSwTb6OX8cvvkj4baRX3
         LfSg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780074094; x=1780678894; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo9vdvnpP/dC2LtU7WORLK5XbIFaK1m3SK7VhetHHiU=;
        b=Z4nNxaly4YJ3AyFPNxHc8ua2lagtv6SQJI/HVQX0GH0y+rbcCmVyXSXsSBp+EhDewo
         H8oWYmubHNT49Zq6EKeSSIWM6wd6Ah+kZ0nRryUjBNO7XmYJGQ3iDY6Y0csCHPfoTSUx
         EAUdT/ks+fmEnnFr86vKMpjYyUbQ3WAzzDS7eboUBc16NFSQRZYJxzFNMip0N1I32Lmx
         tvbULIkpn1AcKdDQyvYVxhM/0DLPc8gh64TXqNdNzry3rIf8bx8gr7ewgGOE+E4bXm6x
         a5d8r3INoIQWFWXYAQ94IJkIRZv1r/PGMPNtno2PWLn2TXrkxvc1FU7r41RMxK+TZxI4
         25EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074094; x=1780678894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo9vdvnpP/dC2LtU7WORLK5XbIFaK1m3SK7VhetHHiU=;
        b=K3ryTakFpD+22YVCxGzff1oQgp3NOPs9why+8muaaPKKgLIysj+ebuuqQBfAE/LCOi
         TCt46SP5PfhLjomEyCNey31PZcBV/psuiKJo6hoKExoZfsj6DdOFS+RtfESC1PAgHeFP
         asKYxHFnfzCPO/lpHIwGPY9zyvzBjYo2c1iTpHPYoBLanssK4s19fQ5HUA5JO4U7f57M
         uiAO+SuANUOEuZmaQeFnuCHOeRN1G3AA0in+N0ESdw1v61yx+bl6RXT+Upwz091ZdCAz
         EMZRxMp8BONWcTfUipn4AlYbLNgFH8wct7x8auc+I5ku/YFutr4gXxnDIqYC1lby0FVv
         XOTg==
X-Forwarded-Encrypted: i=1; AFNElJ8l6YSIwtUXCs8hX3THJsSh8w6UEPe2ctYGfjEW9e3iP/zeCFcZEfoJlhGL5xKLzdbNZNxW@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyGCS9ASQ9kJkFJE8VVBhV1LqxNXMnBAu8oHVuyzlE/jkmp/1TH
	krzp6oiXyG2zR8eiK9toZPGxHPVVmy+5ml/FmENwUgH4b7wg6d7nv+hAedFVMKFOQGNiVUwPuA4
	aClQqIJlUB1PVGUePPYehoVlkDLw30oc=
X-Gm-Gg: Acq92OGLZmgLPo+wC8gww2tt0fyt2xSWQFOmGVUYkX4dfbrBiEiYXXcWegfd++f9wtJ
	Teiru2DqSI7HRe6m7QFoaPw9lWksm2G3MjcfUV3irbgw37LtKfOfoTTKe6sNPYn2U3SDVYH9ZIY
	6eTrSOpcA+w54vxhDAl7HzCYCMesn51ESCP+CKOO4aTu4W8Z2azg4IsotDCIN9G/ufZNTby6jo8
	zLF3dMnPFuR2I01O0l3sP/xFepFmRtiUQ+WyOjYDBhQqyjjmJfwJhlfOMUQSa0irSzLXDiKSWGB
	CH1H3iukYnrZg3Mi85P825jmKGgtrHL0aa9/GfvlkTXq7E1RB+9M
X-Received: by 2002:a05:7022:ff48:b0:133:598c:2b1a with SMTP id
 a92af1059eb24-137d426f3famr212829c88.41.1780074093743; Fri, 29 May 2026
 10:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-notes-v1-0-a251ef1c5af4@toradex.com> <20260529-bb-setup-notes-v1-2-a251ef1c5af4@toradex.com>
In-Reply-To: <20260529-bb-setup-notes-v1-2-a251ef1c5af4@toradex.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 19:01:21 +0200
X-Gm-Features: AVHnY4ILiECcTnvB-HaNUYuUJZFCgqQNn3ALsabik8uW5nduK3ob7MHSFPt5QB0
Message-ID: <CANNYZj-4zkd76D8YvMvfYTZQM7UgnrhPfrtVQ1cDSGasTZQzAQ@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 2/2] bitbake-setup: write notes for
 generated build configs
To: ernestvanhoecke@gmail.com
Cc: bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 May 2026 17:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9545

Thanks, this lgtm too.

Alex

On Fri, 29 May 2026 at 17:00, Ernest Van Hoecke via
lists.openembedded.org
<ernestvanhoecke=gmail.com@lists.openembedded.org> wrote:
>
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> For bb-layers configurations, bitbake-setup currently writes an empty
> "conf-notes.txt". Configurations using "oe-template" get this file from
> the template.
>
> Add an optional field called "notes" to configurations that populates
> this field when "bb-layers" is used instead of "oe-template".
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  bin/bitbake-setup                                                 | 3 ++-
>  doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst | 5 +++++
>  lib/bb/tests/setup.py                                             | 4 ++++
>  setup-schema/bitbake-setup.schema.json                            | 4 ++++
>  4 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/bin/bitbake-setup b/bin/bitbake-setup
> index 220540f7f9ca..e22e5b77bde1 100755
> --- a/bin/bitbake-setup
> +++ b/bin/bitbake-setup
> @@ -301,7 +301,8 @@ def setup_bitbake_build(bitbake_config, layerdir, setupdir, thisdir, update_bb_c
>              f.write(bitbake_config["description"] + "\n")
>
>          with open(os.path.join(build_conf_dir, "conf-notes.txt"), 'w') as f:
> -            f.write("")
> +            notes = bitbake_config.get("notes")
> +            f.write(notes + "\n" if notes else "")
>
>      def _make_init_build_env(builddir, oeinitbuildenvdir):
>          builddir = os.path.realpath(builddir)
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> index 1252f22c823a..e99cf7b3415d 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> @@ -1057,6 +1057,11 @@ They contain the following sections:
>        snippet. This is what is prompted during the
>        :ref:`ref-bbsetup-command-init` command execution.
>
> +   -  ``notes`` (*optional*): additional information written to
> +      ``build/conf/conf-notes.txt`` when ``bitbake-setup`` generates the build
> +      configuration from ``bb-layers``. For ``oe-template`` configurations,
> +      this file is provided by the template.
> +
>     -  ``configurations``: Configurations can recursively contain as many nested
>        configurations as needed. This will create more choices when running the
>        :ref:`ref-bbsetup-command-init` command.
> diff --git a/lib/bb/tests/setup.py b/lib/bb/tests/setup.py
> index 638d56d3bb32..ffe390db1bda 100644
> --- a/lib/bb/tests/setup.py
> +++ b/lib/bb/tests/setup.py
> @@ -136,6 +136,7 @@ print("BBPATH is {{}}".format(os.environ["BBPATH"]))
>              {
>                  "name": "gadget-notemplate",
>                  "description": "Gadget notemplate configuration",
> +                "notes": "Gadget notemplate notes",
>                  "bb-layers": ["layerA","layerB/meta-layer"],
>                  "oe-fragments": ["test-fragment-1"]
>              },
> @@ -249,6 +250,9 @@ print("BBPATH is {{}}".format(os.environ["BBPATH"]))
>          else:
>              with open(os.path.join(bb_conf_path, 'conf-summary.txt')) as f:
>                  self.assertIn(bitbake_config["description"], f.read())
> +            with open(os.path.join(bb_conf_path, 'conf-notes.txt')) as f:
> +                expected_notes = bitbake_config.get("notes")
> +                self.assertEqual(f.read(), expected_notes + "\n" if expected_notes else "")
>              with open(os.path.join(bb_conf_path, 'bblayers.conf')) as f:
>                  bblayers = f.read()
>                  for l in bitbake_config["bb-layers"]:
> diff --git a/setup-schema/bitbake-setup.schema.json b/setup-schema/bitbake-setup.schema.json
> index be8772db1b2d..6a39e66a0ae4 100644
> --- a/setup-schema/bitbake-setup.schema.json
> +++ b/setup-schema/bitbake-setup.schema.json
> @@ -41,6 +41,10 @@
>                                  "type": "string",
>                                  "description": "Human-readable description of the configuration"
>                              },
> +                            "notes": {
> +                                "type": "string",
> +                                "description": "Extra notes that populate conf-notes.txt when bb-layers is used"
> +                            },
>                              "bb-layers": {
>                                  "type": "array",
>                                  "description": "List of BitBake layer paths to include, relative to the layers download directory",
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19565): https://lists.openembedded.org/g/bitbake-devel/message/19565
> Mute This Topic: https://lists.openembedded.org/mt/119548246/1686489
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

