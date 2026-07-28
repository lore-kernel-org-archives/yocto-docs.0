Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5BEC531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 10:41:37 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8584.1785235290379761057
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 03:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=qT/FuXBx;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Mi0FE9Cn;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 77C757A03B4;
	Tue, 28 Jul 2026 06:41:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 28 Jul 2026 06:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785235289; x=1785321689; bh=T+YNFx7UAW
	xjjIOhc5NgPdzIynuA4w4cMc8Xge9y+wo=; b=qT/FuXBx8J+22QeoSHviHt7m9R
	LUdqEUCGWm+yxDWiIWQVp6OPRvLUFvyS4rehB80WQF7POhTYLlMgSSlvLko6mNxC
	u0vEaupTKphn1qUQf3w5tfD6OClesyeJmCDNGpd6ZulzpNGDaNFHj3n6kSO5lUzg
	i2xZWv9Xg/hSBCMAlUqQoNf8Fbi1qE7UscTB5ljeDshJr071LXLTlmrXZfXd8QV+
	Ky1irvwj+82RxtFL8wMyMxfTUGdfe7tSvMoL6r84lau+Bro4ygR8Iglextle5J5S
	IiyQrPQxXidiOETGEK7RRSmkQa0an8gPXiB+JkYFuq6f43B1DcrM6l5ft4lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785235289; x=1785321689; bh=T+YNFx7UAWxjjIOhc5NgPdzIynuA4w4cMc8
	Xge9y+wo=; b=Mi0FE9Cnvyj9fNPJ+wuR06T9HzlFfA856Mtr5OyjS6mtg3lufqO
	U8LIAmCcrbqgT733N6SkMi/N5/mc9JsSA2PM6CbDWxYny4pa768wxl+MuksXUBw6
	El4ZFbw5wlKt/e7m9/zy+91/PN8NIBJaVZZoXfKKu6grObA+r9L4DAldNkpTt+Js
	tt9ZcUX/fdWLYi/EDukI35KgPDaJ93ykLQaFlPg16o9ONADkb51r4CPcvYpqFKPR
	iSZiXSar6rh3grTDHGzqU0T2HdA8dfIS+rMs2I64UTrjKGznDGofpYJfijwCJ5ik
	kvPIs3UvoSgBCGu7upXP6Etxe4yigtrZ+9Q==
X-ME-Sender: <xms:WIdoasXRbAIFhTJ5KhoWtwErFAwFrYblTij_TuT3T-J_podWAj8kVw>
    <xme:WIdoankPl2fgoNL_Rv-xFcReIcYldPHpjUYXWQy8z1J1jLCE5b6d4QzK2kNjikfkY
    x4BqT-UChIE8U0IAgjKihC9ovtx8lifPtXBKtgZsT3Eb4IOeLIyhUE>
X-ME-Received: <xmr:WIdoalZarnKVktFmmH6fX7IGHz71ueVIIztRf-99D_7BSCPCAHbgCo5bZHyA28XYNCFxrxWMaFf16RsuFIS6wfI2maAARYPkqtbTs7MPX-44>
X-ME-Proxy-Cause: dmFkZTFaH/m9+x9OzGI/vNiQIn1xUtbcr8EuD2QmVg5avrYJfpHWb+REntd21Pg/JL9ipJ
    P/2E3tIx20+WjGEhkphJntmLtHLHHAFFzDomIdMe6WIoxLJsWSuxKCOf7So0FnUwY134Jy
    kDAleBt01W5Z9kBWveYisOAMI5yqkEzM/77Il2EXbhL+bSWFBzDSOdzPgMIRsFfDWEHpmb
    J12rSZCocDWV4XQqepkoVYmDRI16C7x3UkerLKJAz+x8b7WUVOdK+0KabCrf9UbVHFbokE
    qkPvwxUtRdEnSo6LewSl+ZokNoWN63vCpG/F11L8/QzqBaNJ94SjGOOK1o9/aTVf6SGeTh
    lYekbfFwAye50jVMYHc8uRvqQXGkiq/1Z9rE6PehKo6Sh0c05CSPKK8WbW2pX4xCIsJL8T
    VTTq9rYUfePNr3EmTAP72UU3dAsZ2nSDcLEpEnt+ltpiwNIcpGvPv3478mFw7UbDGfr7ke
    G4QT3/iNb8bx6uEWJhk9KeC6r0OghuP4nEi+A2BHReb4SWoT0gfdZRmn2LhoW88hu3sWpR
    YgPn43Zq3c0RjkyvLGBUwSZaSQXM/7UI6JYegVMVNZh/Dq23QQA3snlKDFgD7jdYI1Vo8o
    Bn41jDqJ4vlV32Ipuy4/H+5FBcEbnJ5mO/qtsIfsS7Hqvgs/FXJCDM0g8qlg
X-ME-Proxy: <xmx:WIdoaqPIzS1aGg6zQnC9n65PqmZbNTytyCctwx2qUKpijYkI58rOwg>
    <xmx:WIdoaiYVZmARfqq87ONL6TnPCkl2UsS9FZdHuCPtnEooUGI6zlYu8A>
    <xmx:WIdoag1zFYRNGXLWEs4stn6llm3QrnN42HxPbstVpRP1m3LM5hgWmw>
    <xmx:WIdoage-ZmCReZFREbRlpxr3IYtcuxtMJdLKGoOaP-BA8Is2C15-Kg>
    <xmx:WYdoajnRLmbZRPXTjfaA_Nn4DLSC-BJ8rx7tOw5LQy8a10aKVyOiWbr->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jul 2026 06:41:28 -0400 (EDT)
Message-ID: <47257a97161dd37bb8e3204231893fe609cb1040.camel@pbarker.dev>
Subject: Re: [docs] [PATCH v3 5/5] tools: Add check-confusables pre-commit
 hook
From: Paul Barker <paul@pbarker.dev>
To: niko.mauno@vaisala.com, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com, quentin.schulz@cherry.de
Date: Tue, 28 Jul 2026 11:41:22 +0100
In-Reply-To: <20260728090746.27793-6-niko.mauno@vaisala.com>
References: <20260728090746.27793-1-niko.mauno@vaisala.com>
	 <20260728090746.27793-6-niko.mauno@vaisala.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tpC2fA7WQohHUCgyNxyY"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:41:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10173


--=-tpC2fA7WQohHUCgyNxyY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-07-28 at 12:07 +0300, Niko Mauno via lists.yoctoproject.org
wrote:
> From: Niko Mauno <niko.mauno@vaisala.com>
>=20
> Add a check-confusables script, in the same fashion as
> check-glossaries, that scans the documentation .rst sources for
> non-ASCII "confusable" characters (curly quotes, en/em dashes,
> non-breaking and zero-width spaces, etc.) and reports each occurrence
> with its location and suggested ASCII replacement, exiting non-zero if
> any are found. This guards against the class of breakage fixed in the
> preceding commit, e.g. curly quotes causing recipe ParseErrors.
>=20
> Legitimate non-ASCII such as box-drawing characters used in directory
> trees, accented letters in contributor names and CJK characters are
> intentionally left untouched. No-break spaces are likewise tolerated
> on lines containing box-drawing characters, since the tree command
> emits them as indentation in directory listings.
>=20
> Wire it up both as a local pre-commit hook, which checks the changed
> files, and in the Makefile "checks" target, which scans the whole
> tree, alongside check-glossaries.
>=20
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>

Hi Niko,

Are there any existing tools we can use instead of implementing this
ourselves? Perhaps https://pypi.org/project/confusables/ ?

Some comments below if we do want to merge our own implementation of
this...

> ---
>  .pre-commit-config.yaml               |   5 ++
>  documentation/Makefile                |   1 +
>  documentation/tools/check-confusables | 115 ++++++++++++++++++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100755 documentation/tools/check-confusables
>=20
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
> index 000000000..d9f27b337
> --- /dev/null
> +++ b/documentation/tools/check-confusables
> @@ -0,0 +1,115 @@
> +#!/usr/bin/env python3
> +

This needs a copyright and license header.

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
> +    "=C2=A0": " ",      # NO-BREAK SPACE
> +    "=E2=80=AF": " ",      # NARROW NO-BREAK SPACE
> +    "=E2=80=8B": "",       # ZERO WIDTH SPACE
> +    "=EF=BB=BF": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
> +    "=C2=AD": "",       # SOFT HYPHEN
> +}

We should not directly use confusing unicode characters in this array,
we shoud use '\u' escape sequences.

I worry that the above is only a very small subset of the confusable
characters, and this list will expand over time.

> +
> +NO_BREAK_SPACE =3D "=C2=A0"

As above, better to use a '\u' escape sequence here.

> +
> +
> +def is_box_drawing(char: str) -> bool:
> +    # Box Drawing Unicode block (U+2500..U+257F), used for the directory
> +    # trees rendered in the manuals.
> +    return "=E2=94=80" <=3D char <=3D "=E2=95=BF"

... and probably here as well.

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

Best regards,

--=20
Paul Barker


--=-tpC2fA7WQohHUCgyNxyY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamiHUhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjajAP0bXRZMRrKtWIdCz3L8EsVJD1aLKNmkyKRJ
gnbqrmrCdgEAxmOXdWZSc5Urb11tT76HDzLvfSNMVxQZ6vjfeSHSNQc=
=BBxV
-----END PGP SIGNATURE-----

--=-tpC2fA7WQohHUCgyNxyY--

