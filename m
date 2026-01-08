Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D81D1D467
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:48:12 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7943.1767883687568804431
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 06:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=ArbNZR40;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Ba48gO1h;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DFCEB1D0011C;
	Thu,  8 Jan 2026 09:48:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 08 Jan 2026 09:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767883686; x=1767970086; bh=k9GOcGURte
	QrokH/doEzE+qeQyniHoHoh13nD3Zu2qA=; b=ArbNZR40HFYlFOq/hlTdqZJ4l7
	ismkH4NaH0d4PMBJc0WLawFurIcMWHHkhBHjkLcy9brRnDaoQ0ngwOjVIl9wrw21
	9OKc5h1hPA/5TKmEqj1H5gpqd/ZNK+/H5POU7loXyrFAvoVu7cwIQBEypnz3dV4l
	/y6RXIlfIFhU7dME8vzgYJ1V5WlAgjLC1nL1pokutBldbxZYJI8PCo52je6+Oj0G
	Oloizzs7SS6CkOeoExTumysMK0H/DouSJ7cE6Evr/TDo/pyTJ8b9Osk/Di3AH1Bu
	xKWdZ/IP8GfK4vXJ/NdHc9F1LhgIrzx/SVEneIpJIQFpl0Q9O7e18ShYZ+vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767883686; x=1767970086; bh=k9GOcGURteQrokH/doEzE+qeQyniHoHoh13
	nD3Zu2qA=; b=Ba48gO1hs2mZUYPrRCl6U34opux7QK0hyMbOgDAxHXpUFd/R/KS
	DDpWM59VdpgHxoaEWdcG48wgYVuSjeBc7+J/77aMMDb/Ks4T7xm24QTlJmAzBZEE
	MJ9gO2Ni5w/eiES3JNrN8VZn1RCHZh9XEDrfPPI0Q6ApmYwjfhc47WH1jLewpJBb
	7siSrtugkM1z3pS2IDVBsJnFXHBGSbveJJjLohjABLL09MwhlHL/3ruuHhebGBXH
	NjL8MAawPG1IwSLmYOUj8L1RsNrRzPLv1Nr33qr2MnZ7d8luWdPml4yhlffRj1Ff
	kyrflm+iL/khwMvx2ZGaXAIAURahLXzvpKw==
X-ME-Sender: <xms:psNfaWoQje3K5GuRiNxSjSmsv3Xj9j0lV-MNVcJDsf-6F2ay_BCE3w>
    <xme:psNfacEwWaEw95ISMyXg-O6ZtUfHEBfDZSlxg7u5NcBrsNe5v-cG1OUEmK2UBszzV
    AJmiAde4QAVcUeOylnCmatdQIIu4s9q6eqlIeeKjEbbFz_C85KlPxI>
X-ME-Received: <xmr:psNfaYkwMVnvXZgMWHKAe7JMh3ANHkMWZOzcNCVuBo3oI2RX7Ms59cyGUyUSX92q-EpEiwsmeDsTeD_jQgL_zMhxCN9tbXgrYhW7h_hn4gYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjedufedvhfehvedtudelvdeljeeiheeiveffleehffeftdfguddvveejkeehfffhnecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepugho
    tghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthh
    homhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:psNfaflDo6Cj7TQwXs5d85XjuSRoByvQjM0nJxE0neZO4iDvTkyrhA>
    <xmx:psNfaZsigxY4cB8m7jUWH5huyk5JUPPOGb-x1xy8llHfNVQrWWVMxA>
    <xmx:psNfaSl_YsKI5voN5izh60MbHGDo5JSo3N4UDPFpYv0pC_YpRDLvTw>
    <xmx:psNfaUsEznfojkLfZ1ppNoMOZJ0zwkZBfPNO42mtHcsXMDHSsB1U3w>
    <xmx:psNfaedoF1pAmEuFVHOqZIIpN7T6piwMX1lzLygCGxiWCTp2lVeDo4SS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 09:48:05 -0500 (EST)
Message-ID: <76a20da7b564f312a1179d8fa955c6245f44ec98.camel@pbarker.dev>
Subject: Re: [docs] [PATCH] contributor-guide/recipe-style-guide.rst:
 explain difference between layer and recipe license(s)
From: Paul Barker <paul@pbarker.dev>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 08 Jan 2026 14:47:59 +0000
In-Reply-To: <20260106-layer-license-clarification-v1-1-99c69ec1a878@bootlin.com>
References: 
	<20260106-layer-license-clarification-v1-1-99c69ec1a878@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=mQINBGC756sBEADXL6cawsZRrDvICz9Y1SG0/lW1me4xpq36obh7a0IGAzp3ywNRb/4MO
 DTqP4+DD0cIFuDY41/N17g0sNlp8z+/k/IIDmNPtYQOTVmAkrkdDU4BP8dD3Cp1PUw6nrbInfujAJ
 NrVM0IVDkwKTbL2Nu1P+xns4MIpF9Kj4XN5celYJ9vEJ2n0Bo0nO5T5vg46dihIaDl+24iNIHSsHq
 YyEdMBfY8kY2RulpaAyFOuaaHdIeDkejVvO5xLSiYLjB5qrRhgH134lJXsuLOsFQ64ybGECuOasnb
 auevsPBAaroQW0pqVb9FneGrWHxMCLlQHJRqQJRdVa6bsUdp6NWra8/0msPawSrFwGQdfJBTA3aXJ
 C2CG1JxEgj6QQjEQA49DSjgzdhInbiIK8Vbp/zedM4aVue7qJnwPMTFQM9lYx63b7wLN4Tu8B9YZ0
 UFdSwMCJuqmYGsYRUYdwM3ArjS0VO6WpU+HBKvzLK5GQfUTSM8KaZ5eA2Uo2ain8SSZb+WptUYKpx
 F9jbtCPbjpZKzGuX4iHFl9eT75TM9iXJNGAjB5xigkADLwVfPoJ5E53S+KdNVuOWHugyLMPNAQHOw
 pw5Rey+0zxyzPd4wphutc93UIU5g/029ngAc7DuKCq12jl7fhkjqFlFtYPIc1k7nd+RSezmH/qRes
 bMErHSX1MBSZQARAQABtB5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj6JAlcEEwEIAEECGw
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaAzHVAU
 JCTdOhgAKCRB0l1yBt+ZrrA51EACS7IYZaliCgQEhq8nnsQotchJtIZbO6nr8tk+6gicX0loJYqsY
 P2/XZ/MaF8kWYSGPIHjiCcB8tEISUFKPAvfCu0Q/X7n62AkSUZOhsQ6T/ajCaXStv/P28kQmGzoCp
 6ljK/zALMWKvWFEbLaZprIWV8AZJxzJWhfSdb+1XnLlmwhBCfjXJeR/TlGWhNTqTO6vyAtZ5OpGgq
 6N9EG60EQd4YWYwliDhCoUYRYR8qpp9JMrsDm/dzwd/A2/3rR0zzCtkha29kHqdVJtsd7bbiVLr8/
 Zpa9Wcd7EG32CC25DUdkarU7f2P+goFVXfddGQRPy7l9uwF4kmtLGeuxWCCS8+4FPadifGvL8UoE9
 62fbxdHTzhjj0Yqs8zDgEwQUxFjpbmTseVx7QdoEe783jWqH4QhCeuo2kSjC4/VIRGDAS0/7Hq3rj
 Iqqg6zGY8YQRvUyoOLn7Ip7WbHkZOUtWPjPbxe2tgeCttZkGrLQCosH0dlC0Hm7KWs+XHFp5d8OVd
 WzIgWUvYkVaDeLHe3b6tM8AXoixS1rSQrnrAs/O/62Nx+k9+XVAy1clY2jdYOstuPvDhcqkT10RPs
 o2qQnH7RGh2DCVu1D10XwDE1CWZ4Op70BO3g/I02ojT6kG4MHh6JX9+tjpjOINQQf+rGiHzj1YZYf
 z0oc2b0NQI//cy/pDbQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaAzHVg
 UJCTdOhgAKCRB0l1yBt+ZrrBr7D/oCOAaVVHKCuFHHJjnCNuN06o7BRgBUR8IzQxDSc0WIhTSNaa7
 OWPSDanFtDJwOVhe7Ongu8ZF8gsLXg8jb9iS8J2lsm9q4tID3NCQIL0PgjI2/hKKOt1dZs4RGcFXj
 v1nVEwFcvaJE4996tr9UMeZeOtipdlnGoh4Sozs2UvWydnc8SZZ3hCqxbJiorxD7wdrR4As5rqesP
 YwiNqE4KW3jUavf1Sr0U94Umv4l5UPGQQekBxjh1ujsCo05g4IByS3RlDBxCQDvXAMBVHW20PLofD
 aFqNpynQwAdpBS/cvX7tDK2pq+Rd4YK8uuDoHxH18dfCZcGYzSEUJ6y+rbYiJGh01mJFOM0oJP4DO
 9L79mJpURUdZNhI5/GVkCCxwt6HcNt24ertMlHDQkhZ6igP7zBgzODZ1sizODISaBh4M7lyxsBl76
 0dwghNbczt5ytG37mPLWjYaiJMeU7xQtoQo3yZDQvUSMnfFMxWYJO9Hi4P6H2gnMsDrPRnfr68vfP
 rbseTtQM8cpfGnV0FzdFfHSTMJfcFA4BdeCJsn73JHuNEBMjDvUfgjN1a661nEzA5Zd26HQZQ1mQM
 zRkrHto4z7Y86q05esioZ8Vd2Dhm1SMCBY9PNd5QrGpS67uP0wGOK2o3q9eQmxjenFHGAaOuTEZWT
 UpTTTw8SSeLBAHSSQ37QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJTBBMBCAA+AhsBBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEmLKqwQCsP4K7XVRndJdcgbfma6wFAmgMx1cFCQk3ToYAC
 gkQdJdcgbfma6xTZw/2PQ+vjkegBRAHxNIMcj0j9QfP45ZE4bmyGrCDb5i8BwoAJccilT8chvVFgB
 AjG40Zx4oFcRKYYe6AkC6/B5U71307/nqPtt0gEy0VmTi0V+28eQPrNiTLa+OL9B5SGki/45N3g5V
 hdqDNdvx/P2k1cg8YsndVE5ASmdPI2l96n7dqd0fW2C/rzrYNUQ+mPyvNgOGcD82YzahLRfb2u/GV
 CWzEc2iplJeeWlUGoYHPCo4ztZDqJghCfgBab0RBJexdTyJl2QFs/osCM3yp02nTEUV/EiKbXcuWu
 4fvJ3xRtopQ49DMQtsTS3xB0vaPgPeBYb6DeJsLpR6be31mvEmhHGPEuVlxXNsXig1JNS0S+U0NhH
 R1fKNc1uwHE2eTFhFKHK+BhyzJGBWU3reEGjm9BygE9G591bz3+UASdqeT7FY7MGq55NqUVHTlW9R
 +L+IYXzlKvtcF8xDaZLo5MGD/2WTjdbMm25cMc+Nj4MpElAKdvjneViv8NIfyBnXcXi4zU89mh377
 2+rcJTO/Hy87NN1G2LEOKr9zFgvm+CLeoGi2Ay8NyrB3q5+ptE3ziYIPJmq84qFw1SUy4Nq+VF4yc
 OqpPZn7Ij1ga5IAOHNRi5MbyRFROYOeaOj7sz7S7roHQwdP3Q1qTwTOv30hlOSe6uz4PTBiEIKBQH
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2h+kT3+wh6wMUR50z+KG"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 14:48:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8423


--=-2h+kT3+wh6wMUR50z+KG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-01-06 at 16:30 +0100, Antonin Godard via
lists.yoctoproject.org wrote:
> Explain that the LICENSE set in a recipe does not apply to the recipe
> file itself, but to the underlying software. The license of the recipe
> file is the license provided in the layer itself. Give OpenEmbedded-Core
> as an example for this.
>=20
> Fixes [YOCTO #14410]
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/contributor-guide/recipe-style-guide.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/doc=
umentation/contributor-guide/recipe-style-guide.rst
> index 806bf2384..6a3e9043c 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -221,6 +221,18 @@ Recipes need to define both the :term:`LICENSE` and
>     ``meta/files/common-licenses/`` or the :term:`SPDXLICENSEMAP` flag na=
mes
>     defined in ``meta/conf/licenses.conf``.
> =20
> +   .. note::
> +
> +      Setting a :term:`LICENSE` in a recipe does not apply to the recipe=
 file
> +      itself. The license of recipes, configuration files or scripts is
> +      specified by the license found in the :term:`layer` that holds the=
se
> +      files. These license files are usually found at the root of the la=
yer.
> +      Exceptions should be clearly stated in the layer README of LICENSE=
 file.
> +
> +      For example, the :term:`OpenEmbedded-Core (OE-Core)` layer provide=
s both
> +      the GPL-2.0-only and MIT license files, and a "LICENSE" file to ex=
plain
> +      how these two licenses are attributed to files found in the layer.
> +

Other layers may want to handle metadata licenses in different ways, for
example by including an SPDX-License-Identifier comment at the top of
recipe files. So I think we should keep this note more generic.

  Setting a :term:`LICENSE` in a recipe applies to the software to be
  built by this recipe, not to the recipe file itself. The license of
  recipes, configuration files and scripts should also be clearly
  specified, for example via comments or via a license found in the
  :term:`layer` that holds these files. These license files are usually
  found at the root of the layer. Exceptions should be clearly stated in
  the layer README or LICENSE file.

  For example, the :term:`OpenEmbedded-Core (OE-Core)` layer provides both
  the GPL-2.0-only and MIT license files, and a "LICENSE" file to explain
  how these two licenses are attributed to files found in the layer.

How does that look?

Best regards,

--=20
Paul Barker


--=-2h+kT3+wh6wMUR50z+KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV/DnxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0buvFAQC2lVsqDKd3mthK4V+/y8bv38xmdlw4/YXv
p433xwHtJgEAu3OOxDgZiLd+XDUxpeVWu5P5Fs/zYJp8NgjPiF/2awE=
=/43Z
-----END PGP SIGNATURE-----

--=-2h+kT3+wh6wMUR50z+KG--

