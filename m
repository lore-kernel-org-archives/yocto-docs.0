Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D795BC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:53:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6708.1785225200627702543
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Yizui8Qy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A90004E40FBD;
	Tue, 28 Jul 2026 07:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E5F3601BF;
	Tue, 28 Jul 2026 07:53:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F13FB11C13E11;
	Tue, 28 Jul 2026 09:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785225194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vovuv61taOjHMd6v63NHz8sx9Un/Efaf6ZNohDtgB8k=;
	b=Yizui8Qy5tZjqp3nl5dPaUrgIkN98vEibMvXhrxOBf9gOL+9RBPpVRpii8uRUsiJCuJIXV
	z3Ax2wRkWcyfdM75dQQ1knB0fF9nx/7SMdVYo/o/Dn8bWrAL8zsOIE0aIzEsoDpzq3JFur
	P3c+CqZY5+Txr9hgo56O2jhndVm4pV4Dp2UO5eXFVvLdDCfsx2KgbDbuXZZV5TZ4Hvkmj7
	j2jvaUz2OJ4zY2PoYndCWff7TarRGhuCq2lxOGaunKGWFGIKWuu7hZ4E2u81+NP85MmBg/
	/puACkYEq/x7GzL2BL06y4qG9JNtOzejb8UU3tnO+Zm5OIYFLfgSfbVhJpiYKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 09:53:12 +0200
Message-Id: <DKA1IJIDVAHQ.324SKDQV530OU@bootlin.com>
Subject: Re: [docs] [PATCH v2 5/5] tools: Add check-confusables pre-commit
 hook
Cc: <quentin.schulz@cherry.de>, "Claude Opus 4.8 (1M context)"
 <noreply@anthropic.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <niko.mauno@vaisala.com>, <docs@lists.yoctoproject.org>
References: <20260728072328.11926-1-niko.mauno@vaisala.com>
 <20260728072328.11926-6-niko.mauno@vaisala.com>
In-Reply-To: <20260728072328.11926-6-niko.mauno@vaisala.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:53:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10163

Hi,

On Tue Jul 28, 2026 at 9:23 AM CEST, Niko Mauno via lists.yoctoproject.org =
wrote:
> From: Niko Mauno <niko.mauno@vaisala.com>
>
> Add a check-confusables script, in the same fashion as
> check-glossaries, that scans the documentation .rst sources for
> non-ASCII "confusable" characters (curly quotes, en/em dashes,
> horizontal ellipsis, non-breaking and zero-width spaces, etc.) and
> reports each occurrence with its location and suggested ASCII
> replacement, exiting non-zero if any are found. This guards against
> the class of breakage fixed in the preceding commit, e.g. curly quotes
> causing recipe ParseErrors.
>
> Legitimate non-ASCII such as box-drawing characters used in directory
> trees, accented letters in contributor names and CJK characters are
> intentionally left untouched.
>
> Wire it up both as a local pre-commit hook and in the Makefile "checks"
> target, alongside check-glossaries.
>
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .pre-commit-config.yaml               |  5 ++
>  documentation/Makefile                |  1 +
>  documentation/tools/check-confusables | 77 +++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100755 documentation/tools/check-confusables
>
> diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
> index f2b73a481..d6008b609 100644
> --- a/.pre-commit-config.yaml
> +++ b/.pre-commit-config.yaml
> @@ -6,3 +6,8 @@ repos:
>          entry: ./documentation/tools/check-glossaries
>          language: python
>          pass_filenames: false
> +      - id: check-confusables
> +        name: Check for non-ASCII confusable characters
> +        entry: ./documentation/tools/check-confusables
> +        language: python
> +        pass_filenames: false

I think we should pass filenames and check only the modified files, no need=
 to
checking the entire tree each time?

> diff --git a/documentation/Makefile b/documentation/Makefile
> index fe0574537..87a6f8a8b 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -37,6 +37,7 @@ clean:
> =20
>  checks:
>  	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
> +	$(SOURCEDIR)/tools/check-confusables --docs-dir $(SOURCEDIR)
> =20
>  stylecheck:
>  	vale sync
> diff --git a/documentation/tools/check-confusables b/documentation/tools/=
check-confusables
> new file mode 100755
> index 000000000..f79ee046c
> --- /dev/null
> +++ b/documentation/tools/check-confusables
> @@ -0,0 +1,77 @@
> +#!/usr/bin/env python3
> +
> +import argparse
> +import sys
> +
> +from pathlib import Path
> +
> +
> +def parse_arguments() -> argparse.Namespace:
> +    parser =3D argparse.ArgumentParser(
> +        description=3D"Check documentation sources for non-ASCII typogra=
phic "
> +                    "characters that should be plain ASCII")
> +
> +    parser.add_argument("-d", "--docs-dir",
> +                        type=3DPath,
> +                        default=3DPath(__file__).resolve().parent.parent=
,
> +                        help=3D"Path to documentation/ directory in yoct=
o-docs")
> +
> +    return parser.parse_args()
> +
> +
> +# Map of "confusable" characters that are frequently introduced by edito=
rs,
> +# word processors or copy-pasting, to their plain ASCII replacement. The=
se
> +# look almost identical to regular ASCII but break tooling, e.g. a curly
> +# quote in a recipe example causes:
> +#
> +#   ERROR: ParseError ...: unparsed line: 'RDEPENDS:${PN} =3D "foo"'

I don't see the curly quote here

> +#
> +# Only these characters are flagged; legitimate non-ASCII such as box-dr=
awing
> +# characters used in directory trees, accented letters in contributor na=
mes
> +# and CJK characters are intentionally left alone.
> +confusables =3D {
> +    "=E2=80=98": "'",      # LEFT SINGLE QUOTATION MARK
> +    "=E2=80=99": "'",      # RIGHT SINGLE QUOTATION MARK
> +    "=E2=80=9C": '"',      # LEFT DOUBLE QUOTATION MARK
> +    "=E2=80=9D": '"',      # RIGHT DOUBLE QUOTATION MARK
> +    "=E2=80=B2": "'",      # PRIME
> +    "=E2=80=B3": '"',      # DOUBLE PRIME
> +    "=E2=80=93": "-",      # EN DASH
> +    "=E2=80=94": "--",     # EM DASH
> +    "=E2=80=90": "-",      # HYPHEN
> +    "=E2=80=91": "-",      # NON-BREAKING HYPHEN
> +    "=E2=88=92": "-",      # MINUS SIGN
> +    "=E2=80=A6": "...",    # HORIZONTAL ELLIPSIS
> +    "=C2=A0": " ",      # NO-BREAK SPACE

Actually, since the `tree` command uses no-break spaces, I think it's OK to=
 keep
them otherwise we'd have to convert each tree output, which also might be
confusing.

> +    "=E2=80=AF": " ",      # NARROW NO-BREAK SPACE
> +    "=E2=80=8B": "",       # ZERO WIDTH SPACE
> +    "=EF=BB=BF": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
> +    "=C2=AD": "",       # SOFT HYPHEN
> +}
> +
> +
> +def main():
> +
> +    args =3D parse_arguments()
> +    exit_code =3D 0
> +
> +    for rst_path in sorted(Path(args.docs_dir).rglob("*.rst")):
> +        rel =3D rst_path.relative_to(args.docs_dir)
> +
> +        with open(rst_path, "r", encoding=3D"utf-8") as f:
> +            for lineno, line in enumerate(f, start=3D1):
> +                for col, char in enumerate(line, start=3D1):
> +                    if char in confusables:
> +                        replacement =3D confusables[char]
> +                        hint =3D (f"'{replacement}'" if replacement
> +                                else "(remove)")
> +                        print(f"WARNING: {rel}:{lineno}:{col}: non-ASCII=
 "
> +                              f"character U+{ord(char):04X} should be "
> +                              f"replaced with {hint}")
> +                        exit_code =3D 1
> +
> +    sys.exit(exit_code)
> +
> +
> +if __name__ =3D=3D "__main__":
> +    main()


Antonin

