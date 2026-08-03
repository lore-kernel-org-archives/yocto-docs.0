Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618FFC5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:31:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38791.1785745862060301254
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Aug 2026 01:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2YoDpeDh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE21C4E410AE;
	Mon,  3 Aug 2026 08:30:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD7C36029B;
	Mon,  3 Aug 2026 08:30:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FF0211C17C51;
	Mon,  3 Aug 2026 10:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785745855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LJo8mXyNkl8LH4MHQJ4egmHdDGGTIVBmulD+/eb7Qmw=;
	b=2YoDpeDhILQ11lE9s3TRkiweHvb+pWcoQvF6HwQ1/pPIOJDeytNjENQye2tvE/Ow0vw5X/
	uWlRDuiCBH11WC3wIfIIYzZCkef8aWzs8W9l3N0l44RwXKTQ3tYhaJG5RObgbdcS/6m8af
	XUzS3MTkjfqa2R0HnX7kDqxr3v0DoRQSydppniPSmt9DWxtDu8HIWiSFcjYQcPyRGvsORp
	ariepPCcMMxhjB6a5a8LVueT7O4Ee2BOgFVwOFYMExi0ed1vkGRNe6w0oxc/NXmxxg0pTJ
	yrvHX+8vroIJ09u05x25jH4YvsqwXANxE+j4dSbnKzT4lST7eplEqlaSLca1DQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 10:30:52 +0200
Message-Id: <DKF62NG8K680.7XCFNJPQIKZJ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <niko.mauno@vaisala.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v5 2/2] tools: Add check-confusables pre-commit
 hook
Cc: <paul@pbarker.dev>, <quentin.schulz@cherry.de>, "Claude Opus 4.8 (1M
 context)" <noreply@anthropic.com>
References: <20260803034827.26904-1-niko.mauno@vaisala.com>
 <20260803034827.26904-3-niko.mauno@vaisala.com>
In-Reply-To: <20260803034827.26904-3-niko.mauno@vaisala.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Aug 2026 08:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10229

Hi,

On Mon Aug 3, 2026 at 5:48 AM CEST, Niko Mauno via lists.yoctoproject.org w=
rote:
> From: Niko Mauno <niko.mauno@vaisala.com>
>
> Add a check-confusables script, in the same fashion as
> check-glossaries, that scans the documentation .rst sources for
> non-ASCII "confusable" characters (curly quotes, en/em dashes,
> non-breaking and zero-width spaces, etc.) and reports each occurrence
> with its location and suggested ASCII replacement, exiting non-zero if
> any are found. This guards against the class of breakage fixed in the
> preceding commit, e.g. curly quotes causing recipe ParseErrors.
>
> Legitimate non-ASCII such as box-drawing characters used in directory
> trees, accented letters in contributor names and CJK characters are
> intentionally left untouched. No-break spaces are likewise tolerated
> on lines containing box-drawing characters, since the tree command
> emits them as indentation in directory listings.
>
> The set of flagged characters is intentionally small and curated
> rather than exhaustive. A general-purpose dependency such as the
> confusables PyPI package targets Unicode homoglyph detection against
> the full confusables table; it would also flag the accented names, CJK
> and box-drawing characters we deliberately keep, so we would still need
> our own allow-list and replacement policy on top of it. A short,
> dependency-free table kept in-tree matches check-glossaries and is
> trivial to extend if a new problematic character shows up.
>
> Wire it up both as a local pre-commit hook, which checks the changed
> files, and in the Makefile "checks" target, which scans the whole
> tree, alongside check-glossaries.
>
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .pre-commit-config.yaml               |   5 ++
>  documentation/Makefile                |   1 +
>  documentation/tools/check-confusables | 123 ++++++++++++++++++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100755 documentation/tools/check-confusables
>
> diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
> index f2b73a481..876546f9a 100644
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
> +        files: \.rst$
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
> index 000000000..359386e7c
> --- /dev/null
> +++ b/documentation/tools/check-confusables
> @@ -0,0 +1,123 @@
> +#!/usr/bin/env python3
> +#
> +# Check documentation sources for non-ASCII typographic characters that
> +# should be plain ASCII.
> +#
> +# Copyright (c) Vaisala Oyj. All rights reserved.
> +#
> +# SPDX-License-Identifier: MIT
> +#
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
> +    parser.add_argument("files",
> +                        nargs=3D"*",
> +                        type=3DPath,
> +                        help=3D"Specific files to check; if none are giv=
en, "
> +                             "all *.rst files under --docs-dir are scann=
ed")
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
> +#   ERROR: ParseError ...: unparsed line: 'RDEPENDS:${PN} =3D =E2=80=9Cf=
oo=E2=80=9D'
> +#
> +# Only these characters are flagged; legitimate non-ASCII such as box-dr=
awing
> +# characters used in directory trees, accented letters in contributor na=
mes
> +# and CJK characters are intentionally left alone.
> +confusables =3D {

Nit, but this is defined in lowercase, but NO_BREAK_SPACE is uppercase, whi=
le
both are global variables. Maybe make those all uppercase?

> +    "\u2018": "'",      # LEFT SINGLE QUOTATION MARK
> +    "\u2019": "'",      # RIGHT SINGLE QUOTATION MARK
> +    "\u201c": '"',      # LEFT DOUBLE QUOTATION MARK
> +    "\u201d": '"',      # RIGHT DOUBLE QUOTATION MARK
> +    "\u2032": "'",      # PRIME
> +    "\u2033": '"',      # DOUBLE PRIME
> +    "\u2013": "-",      # EN DASH
> +    "\u2014": "--",     # EM DASH
> +    "\u2010": "-",      # HYPHEN
> +    "\u2011": "-",      # NON-BREAKING HYPHEN
> +    "\u2212": "-",      # MINUS SIGN
> +    "\u00a0": " ",      # NO-BREAK SPACE

You could reuse NO_BREAK_SPACE here, if you define it before.

> +    "\u202f": " ",      # NARROW NO-BREAK SPACE
> +    "\u200b": "",       # ZERO WIDTH SPACE
> +    "\ufeff": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
> +    "\u00ad": "",       # SOFT HYPHEN
> +}
> +
> +NO_BREAK_SPACE =3D "\u00a0"
> +
> +
> +def is_box_drawing(char: str) -> bool:
> +    # Box Drawing Unicode block (U+2500..U+257F), used for the directory
> +    # trees rendered in the manuals.
> +    return "\u2500" <=3D char <=3D "\u257f"
> +
> +
> +def check_file(path: Path, display: str) -> bool:
> +    found =3D False
> +
> +    with open(path, "r", encoding=3D"utf-8") as f:
> +        for lineno, line in enumerate(f, start=3D1):
> +            # The tree(1) command indents its directory listings with
> +            # no-break spaces; such listings are embedded verbatim in th=
e
> +            # manuals. A no-break space is therefore tolerated on any li=
ne
> +            # that also contains box-drawing characters (i.e. inside a
> +            # rendered directory tree), but still flagged elsewhere.
> +            in_tree =3D any(is_box_drawing(c) for c in line)

Not a blocking change, but at this point you could probably continue if in_=
tree
is True and move onto the next line. Since we know we're in a box-drawing,
leaving confusables is fine since it's not a command to run?

> +            for col, char in enumerate(line, start=3D1):
> +                if char not in confusables:
> +                    continue
> +                if char =3D=3D NO_BREAK_SPACE and in_tree:
> +                    continue
> +                replacement =3D confusables[char]
> +                hint =3D f"'{replacement}'" if replacement else "(remove=
)"
> +                print(f"WARNING: {display}:{lineno}:{col}: non-ASCII "
> +                      f"character U+{ord(char):04X} should be "
> +                      f"replaced with {hint}")
> +                found =3D True
> +
> +    return found
> +
> +
> +def main():
> +
> +    args =3D parse_arguments()
> +
> +    # When invoked with explicit files (e.g. by pre-commit, which passes=
 the
> +    # staged filenames) only those are checked; otherwise the whole tree=
 of
> +    # *.rst files under --docs-dir is scanned (e.g. by "make checks").
> +    if args.files:
> +        targets =3D [(path, str(path)) for path in args.files]

Those are Path objects, I don't think you need to store their string
representation separately to display them? Why not simply passing the Path
object when calling print() directly? It should get converted to strings
directly. And this would make check_file() simpler:

def check_file(path: Path) -> bool:

    ...

    print(f"WARNING: {path}:{lineno}:{col}: non-ASCII "
          f"character U+{ord(char):04X} should be "
          f"replaced with {hint}")

> +    else:
> +        docs_dir =3D Path(args.docs_dir)
> +        targets =3D [(path, str(path.relative_to(docs_dir)))
> +                   for path in sorted(docs_dir.rglob("*.rst"))]
> +
> +    exit_code =3D 0
> +    for path, display in targets:
> +        if check_file(path, display):
> +            exit_code =3D 1
> +
> +    sys.exit(exit_code)
> +
> +
> +if __name__ =3D=3D "__main__":
> +    main()

Thanks,
Antonin

