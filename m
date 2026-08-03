Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB49CC55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 06:59:07 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.105])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37800.1785740339343963236
 for <docs@lists.yoctoproject.org>;
 Sun, 02 Aug 2026 23:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=7tMIYFSx;
 spf=pass (domain: navimatix.de, ip: 52.101.70.105, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZWvpJIIjMQ2mXiStl6Mw+96IWoh6s+EpN7NKPUbGOdeebAdFdgU7SEU8yCgvKtoYLubDLeFdfLv8V0POY8REZZ32Qdj5o8dtESspHrDW+0RllCQXovykSpMeTxWAlY6LVICqxxnl8lWzVC5RVDw0HTUCDS7KTZLv9zvYcfcRQe+Snyo27r1Z6UObalShXVhnxlNqQVs6jmNbV1rg9Zw9SLlA/ToXV6j7Ugt2TFQMfvaIZRIufKacUUvth5W/jq4Y38F3HkUwk7wY6kfK3dQuLCzKpb34yht4B3TIueI5qVuzSnUtcadwhv8ZC8poAjNIGdnSWEmliHVoKNyINvi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/1fXE9ErYJ5HcZsb/sIT4Ugck8Kfy44RE0Ac5GP40g=;
 b=lZjyuNHn7WdojTzL28EC84qMfG0Ot6VH0C0EMh0WqVvYqeJm+nDpvrwqUtcic55dKVkaf+wCppfxvMGUkrooaf8VL7rO/+s9ZWIt8O9dscZu3nVEg9sROm7wuvsLK518xm+GGG3peOx8R2DqUuLTeTD3CTDa+pojSKerrZXxAGpTb9VxPHGuJOfmWN0dn4h/yETI43/w/X2gj3DS3gGDht4cljyn1n63s6k5S6Q5cVO2/c82zosvw6TsMkqsXJSNSp9nC0WrNPMN1ZM43Xlk8uTLrzyCFoleYtH8hshv/LyNXzqTpPiLD/suVHH8rPAP/h5qEaZ7ArO7XSqMMwXYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/1fXE9ErYJ5HcZsb/sIT4Ugck8Kfy44RE0Ac5GP40g=;
 b=7tMIYFSxrT9VOtFLSmq91CT1USDS28fLpncjdcM5qiIjP+dxmZS7qS2Hxrebose47ZchVF9EPC37uW1HwXeMXIiP/Y5YnC8DbFaUhfMSvPGO4l75z1m0bZDa7I+vPkR3Z02s9o/uQRB/0xt5MY4n0ugo7hQrUl+FQXcuBxza4eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU2PR01MB8541.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 06:58:54 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0270.015; Mon, 3 Aug 2026 06:58:54 +0000
Date: Mon, 3 Aug 2026 08:58:51 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] features: Add distro feature "audit"
Message-ID: <anA5F1vAGnYBEVWN@navimatix.de>
References: <alchGk8fYN2cPmGa@navimatix.de>
 <db22bdb6f13cb1a7159a9284058eba3f07a4a700.1784236750.git.joerg.sommer@navimatix.de>
 <DKA11RVSKMIV.2KTHUGS1LWTID@bootlin.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="pctw26hy6q7ty2zs"
Content-Disposition: inline
In-Reply-To: <DKA11RVSKMIV.2KTHUGS1LWTID@bootlin.com>
X-ClientProxiedBy: BE1P281CA0342.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::21) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU2PR01MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf561d1-255f-438a-96eb-08def12cae3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	pii32xxIVkcH1NzYNAGh+s1cOz3tKOeMp7no4jH5D2Pi2UP6W4pFPrG/ksSaTQ3U020SzJ79PTOXhZJ5l/5P9GzGbRcSxeuEsxbwzAhuR7UCmsiAyUkneMPwAPWz2XHXVcgzzpqdYoMj5Ga/GbidIYPfLexyDNeBvwsq31ByBxU7zs6lkDslqWl23LSbNNTu0gDjO5fiq+KepSC+KSDA7sVU2zpk55d8fvMJVchFuvrqmjZvTOU1ge7CafIimPDQ/LiuVQm7MEBcli0CDuVodeUEX6RmumGFowLDca5Q0cAJOHPFX7t5w5E0O70t7IHe9PRN9w+oERBXyCDWh7h+ia6N0D2hn2PhaSiTCfUaQvtvAMHMu8F8DGjj8XdDCssTgxPA99b5MWQR+zU1rppXEegxTiLEbQz5iqvr3E6t9JFomDB0qrP7inorrEOqDCyW5IrbyYaKqpqtMYWBjT4JX4vDVGePZMqGkUubjAHuUPApduhsoCI8j4o8/7ORjW9Pn3Zv+BqupT5m4qnB3gPW8J/fVXJi7s5lOqYQkTCtRxrQ5MtL808NiLZ5ycyrZniz0VQbgvKp3/jzergxEs1Vt/5wDgAtYjF7WWvm3tGh5O4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?geS0UtrXfd+RON9TpZEgtnbjdhZnhT/k+wZ9V4zGnwlq2BSrRW/WRIGkus?=
 =?iso-8859-1?Q?KfUOtDXPUTv23UXsoR51QwkY6Ix9ZAXrN+nXQ/NOwFaZApGFCTqlfYXHB5?=
 =?iso-8859-1?Q?8ksnvVI60qOr5bTikmsagKuF+gI5cj59Ht1A5LPBpvi2uEe1PT/8jXveX7?=
 =?iso-8859-1?Q?vF9oPVRsg6X80kXe/6ZBT2fOMB05ng28eCe7jM+6xgSGrjTCKvaB/FSuC/?=
 =?iso-8859-1?Q?zJRkHlGbsXB8qNvyeRQcWgYIkIR/4W9fBMI/P1++i/iaaC6tINh7p9rGs8?=
 =?iso-8859-1?Q?sp1LGh4bZodWyiZobGaAmlct8aynYFMwG+/PDuxJACLQzhplniRoTg/jyX?=
 =?iso-8859-1?Q?mZ9AUkugS552lODHOHrJhYeHY7ooK7M0OhWJIvIHwwhnZ4tIJNoa4ix0/M?=
 =?iso-8859-1?Q?sXnRpDiuzGfXpW4Ff6yJ/w43R5DQgfy30IPwKSxS2Dy+fDwxmOf/0aMUz2?=
 =?iso-8859-1?Q?khHAoxehzovniIpaMw4peOlDhofXB4WLYxS0bGwk9sjVHRhwb4M4bZsPi6?=
 =?iso-8859-1?Q?innwt1u/9Kr9nDmNRM3pgrXw7ywWEOuMYN1o+8fNyWvMWFafJ3PwpSl2dL?=
 =?iso-8859-1?Q?fGeHwn+UuKqkvX01VaSPfye3dl5UYF10hmwIHPwLHPa90Zf+xoLarSmuFp?=
 =?iso-8859-1?Q?s994f4ioKM3/GNXvufSWZt78DOK5Bd22y5molBVeh0yoeUzuYaBKQRTz3O?=
 =?iso-8859-1?Q?nelZ4t/ZP7xvI1Sdp+g0f2T4a8B6YLPsodGeBKVqJMNIT5cpJ4VEy1K76R?=
 =?iso-8859-1?Q?r2In3+G6v1LgJ96Krj/QNlbjn3vpQaz9kaZGwB0rYNw8jVOAYo200oIDD7?=
 =?iso-8859-1?Q?uM5VEdALeFEBcbSsSbVYotC6HZdkWcnviZC+QCUPSP55SgnmZPDGiYNRXg?=
 =?iso-8859-1?Q?0W0Igb60Fm8gqrOchk3+e7UtvPgQ1YjGvTcwTt0q0LQYBMCL77GsceFZ5X?=
 =?iso-8859-1?Q?JTA33wUfB73vOFmiBV9iCZkpo+WrPc9A69/XjFbQN8mw71v9y+hL8UvFnv?=
 =?iso-8859-1?Q?TEEX7yMAxTTbJag90LDCMwPimko9wuN4hhPY0Evgvff6sRbBGMj/o4/4i0?=
 =?iso-8859-1?Q?YjBU5PeGxZ2y6iL+kKX/a839Hb7K5n7AM7o7b0oVvovqg5h754Xtn42KOr?=
 =?iso-8859-1?Q?xPqJ+tpO4GH7w6/2uVDKV2IVwKkxY6+h2C2+kTRH/8TZvDD5DHhH9tzOy4?=
 =?iso-8859-1?Q?9rXgj/fDfd/W8VtHo+XnAw1BW4WGxVXm924CeRyqZ3UMualJYKbdhL4fuV?=
 =?iso-8859-1?Q?q4rI+stKyp/BLoiHnbBMs4oe84D3VmM70uToetolllZ2PDqcF++TpincU5?=
 =?iso-8859-1?Q?3xd2G6bWzJQCoRIcZ8nddofrjthDhcOyQdzjlW8aKiurTM8Dmoto7f7dHe?=
 =?iso-8859-1?Q?rk7YxFUqMVt5ERCNyoa2rAovyBjRSQGEAKmX6or10fHJD86oxbBqyAyIOz?=
 =?iso-8859-1?Q?+mJbLqOtvy/iAonewZMXyxXX1/GoUjALES5cuqjbicVl2CSalwgw8nfrQs?=
 =?iso-8859-1?Q?LiPmd4BKAGdoWVVmFLHRV8i7+FN7U+PbUW4diuRRtXkfyLZMqdUhcKsfw3?=
 =?iso-8859-1?Q?lYq7v1jjPwsI/Ecf2rjQM1uESEcO7085sBF5Y8sia1S18NKBGer5GSMHJa?=
 =?iso-8859-1?Q?vJ7enC+91tNda+xoicj4j/CIt8fve2c32O+kQIwtcaH8x4SZjnfamVY4Ue?=
 =?iso-8859-1?Q?a0fzYpWGAvJKIwkm0XHF7yj/A6pf95Ce2VmPRm0c8WWBRCyxY4YQMG60ui?=
 =?iso-8859-1?Q?yuzHV7OCmlEQWO1j6HsvLPXgnRr0ZD2xqpqf9dlMRhCgdjam2dt72q8wc1?=
 =?iso-8859-1?Q?LhKldt3zxZcZjzIrsyGVrCt7JX8l0ks=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf561d1-255f-438a-96eb-08def12cae3d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 06:58:54.0273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqVFa8yJY6zl4JANlofpvsKj3JbLTnM6CCeapO8ikL5b9ZOTd+XC60f78KGkoHyS4xjFg09nARd+t7OcYF9Zq0Ta63UvxYTUwMgfo7X70EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8541
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Aug 2026 06:59:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10228

--pctw26hy6q7ty2zs
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [docs] [PATCH v2] features: Add distro feature "audit"
MIME-Version: 1.0

Antonin Godard schrieb am Di 28. Jul, 09:31 (+0200):
> On Thu Jul 16, 2026 at 11:25 PM CEST, J=F6rg Sommer via lists.yoctoprojec=
t.org wrote:
> > From: J=F6rg Sommer <joerg.sommer@navimatix.de>
> >
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> > Changes since v1:
> >
> > * I've added a link to the documentation wiki.
> >
> >  documentation/ref-manual/features.rst | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/documentation/ref-manual/features.rst b/documentation/ref-=
manual/features.rst
> > index 77d034f0c..d12b7fa13 100644
> > --- a/documentation/ref-manual/features.rst
> > +++ b/documentation/ref-manual/features.rst
> > @@ -141,6 +141,8 @@ metadata, as extra layers can define their own:
> >     section in the Yocto Project Application Development and the
> >     Extensible Software Development Kit (eSDK) manual.
> > =20
> > +-  *audit:* Enables `linux-audit <https://github.com/linux-audit/audit=
-documentation/wiki>`__ support.
>=20
> We haven't received feedback on whether audit should be added to OE-Core,=
 so at
> least we need to note here that this recipe in available in meta-oe.

I have made an attempt to transfer the recipe to oe-core:
https://lists.openembedded.org/g/openembedded-core/message/242609

> By adding the following note just below your addition?
>=20
> .. note::
>=20
>    The ``audit`` recipe is provided by :oe_git:`meta-oe
>    </meta-openembedded/tree/meta-oe/>` in ``meta-openembedded``.

If my commit gets rejected we should add this note.


Best regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--pctw26hy6q7ty2zs
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgwMzA2NTg1MFowLwYJKoZIhvcNAQkE
MSIEIAXMna5jvCsHemEGFQRzQpZCmOzj5k1jgpgRr8G2vd7jMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQC1fc/NezAEkupgt/jHxnm2QXKjL2ZM2oX+JudrKa5PSWfDa7uiYoOvLVxkfPX2N5h8aC2S
EUgfZMT7nbMjx6xDZD2xlaABTBUSYoJyM91XNUhqzVr/YENJqXKyCKfwbV59G98GYqZ7PSUm
32gO1PPtpio06/VZtcitdgSDfZwulB3mpY+PUirN2lOlFbxp0moIHmuQOy8PT+5d220LOqzO
49zPn9+yZYiLCMv6igbEW5FM/I1lA+0Qxzo7dBJHWGrd9WLIfnGj4drBKVm8iWjTxskn7fHo
5wXOu6XWxzh5vPpuyZ6/DggDE5+lngbEIqJvobXvabWtjPKrlYw240wK

--pctw26hy6q7ty2zs--

