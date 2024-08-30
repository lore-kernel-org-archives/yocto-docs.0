Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CA3CA0FE7
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:26:58 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.131])
 by mx.groups.io with SMTP id smtpd.web11.12793.1725020812720897984
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 05:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=miT2bl0S;
 spf=pass (domain: navimatix.de, ip: 52.101.66.131, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGfoYNlfKrixH5JDJKZ32w4Pf7fRsreT/+EcjZ6WzfWWVTyXzxUbo5NEkU7nCB1wC2d82CRhFMm8vtcsXHrI2fnhuU5YrQb/miElRingrP0gXYjNDt7j0a8QB1QMtDMMc/6Qnu20nh9QmXnY+Lx3k03xN6wFyhtUSW8P4TJL2a6+/lI9pTeM53lKYBOyBRfoudLKCGrWyh6oDdslwFNFoD3IGV+dvefnhCd6QW+5IwwU80lz3I/hXB/MyqWH68r7OfZEW0ELpz2TYfA5i9Wv/2IRXtxWOdb0XUlt+YxpULKSSfKZXRlsyHLU10unXDIEdrEbUWT4YMEPgkREg0T/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPFXajWRo6AaIiiqaSx/9ZiJ9SS1Y5w9u469WQ9DLaU=;
 b=eKwSr8RA5TgUsNKiRMgTHZSmE1MHTDygZBgpjJI7AYcAe5ztdm7XdbM5y3SSf8/Ri7BRFmOv0tv2m3sX27NSqhNZ6cc2H08swzlek5Otq6P1pZD8gMPYy/ps/Ox388s4KOhXqrEK3RHJLZKWLwX/mvycV6Y4l9bK4ibCZR8FrsDInyF4ZBbml0fiEh4mrfxanPR7dS7+hdQke3QiYO+AMkzHDDs2fppZ/6n3L7inHZXH20fk/cNcMq2DMsD9ggTsw32IFfpVHgldr7NCvPotY4KdioWSUXjRt6WoyAv4SNA95laHGP65eSnhPZlZpOEmMbpZIJ504e/mPb99UD0M+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPFXajWRo6AaIiiqaSx/9ZiJ9SS1Y5w9u469WQ9DLaU=;
 b=miT2bl0SO1pjmBlUYv8zG4aeyBXIX2lHNScnMefH+MrBdmhGGD9OGIcvccBMCr7xTVg4Kouadj0SKeC+x9kUUYWCMC5Q0UoEpOkUfHhjlpcfnJlbWNaoWymGtoIGHisJD+99U8KEntXUN/bQXtZ7vyePP+bFteQCS0c20LMlH5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DBAPR01MB6727.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:187::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 12:26:48 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 12:26:48 +0000
Date: Fri, 30 Aug 2024 14:26:45 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] doc/features: describe distribution feature
 pni-name
Message-ID: <oid3lh6l2tisxbsnfi27mrcpaaoixkgr7rjrjrp76tzrqq2rmc@4mmdfbgafenz>
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
 <9260b59b-7ac2-42bf-b089-a54181770564@cherry.de>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="alolf7r4k7jajlcc"
Content-Disposition: inline
In-Reply-To: <9260b59b-7ac2-42bf-b089-a54181770564@cherry.de>
X-ClientProxiedBy: BE0P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::23) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DBAPR01MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 084a5484-4f35-43df-a16e-08dcc8ef0495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?T1mQOXge3zziGlB9+x8mwTrS8qn46cJDTEInOmTCP46fanCORPgPzKw+W0?=
 =?iso-8859-1?Q?nQ9rUSo36oCW1lfCR2079n+svZF92SJavDwPrfTB86yZqtvQBInvfMFJWl?=
 =?iso-8859-1?Q?+WWJ6kDKlWDhSGvu4NRIycxLURjiDOpoSK/peH8dnQpnjuaLGtuUhVJYnZ?=
 =?iso-8859-1?Q?yJNS7YVS/UPqMnhfEO0PBzTa7fLnu6vvGPBLhORIwtKZTu4kKX6SkNgsx0?=
 =?iso-8859-1?Q?GPxzgQar1he9JwVGWN9dUoqB7AMEuQaQooBQnobF4oOVqN2ZxHCiEPJJqf?=
 =?iso-8859-1?Q?zfW9i8570MoZFjZuKSLvvmczOwdEuxkdXrpM1PudQjy4jnP05OLfXiC8hp?=
 =?iso-8859-1?Q?/9B5UzwEYVPvbp5XHdTkXcovbeFQ/+ufcaXuKu51guKGUXFkHIWJrhP5pp?=
 =?iso-8859-1?Q?FmJRMsJN3C3Ae+zGqVp8ruQRkKIGw3mXxcAzODjO5s75j4rB7ObRMyAR9Q?=
 =?iso-8859-1?Q?p7vo5PptY1mMthke6Q02s582keO7XilIAxvXL5V36Q0rYjNihS+vtOkCEe?=
 =?iso-8859-1?Q?ZCgOfcMqwP6o/a546ByxxFAzuqNyRxJIzqxCIHE48Bvh4bsUM2qi76Dv7/?=
 =?iso-8859-1?Q?YLGxA6Dt+d0jLWQ4Xi2inXt+2rG48z4vVSw2TeIyQOcpDWvIDlv9HUwoTq?=
 =?iso-8859-1?Q?77dbS2Plc3n1RokYOondq6YVERFZL6Rq1D6lg3cMJTkyLA0gUp0ByO+tSZ?=
 =?iso-8859-1?Q?e3xeT1ky7GE/nFduLhcvPClz4wCjArYx2vtv6ctF6Yg6N9b+vyvMD9+lhF?=
 =?iso-8859-1?Q?kVFzlgyvWmjWzMgwq5zF52cL509gDpvUFpuOkCL4zzY5YpwrE5em8R7m4F?=
 =?iso-8859-1?Q?GjO69xrMqB8acMynHs3q1bQ6YJT+nbabSlqw0Z48OYWh3A+FlO15MLoqPT?=
 =?iso-8859-1?Q?hHsuZFXNtBmvgETH40zY6IldH73L3tY5NcV8i93P5gO4srWw9Hq/MtyK3I?=
 =?iso-8859-1?Q?qHOSajSZ7/GCVMFfU43Uf+haoSl5Upii4DGiUJRDpLlrzpWikL/wIyZXUa?=
 =?iso-8859-1?Q?JRyOPPV08hP7ICP2B8TpbB4Y394BG/xWybpyTvGXY/tiwF8XKJ6IL67/Rs?=
 =?iso-8859-1?Q?XmazOoL17OahVYBVEmCCmdbHL3+f10mWJhATaDQFIPtaE5gIUiI8Sqv3bE?=
 =?iso-8859-1?Q?h5J0MSmLND/lfGfrXlDLpa0RlxOem4K5dlHYSjZ0iCTpaR8y23xXCc4ES8?=
 =?iso-8859-1?Q?rA8t9LL5JqEfJXn0zUszv1FjOtO8L+1vcDYCBgB/s2DTtDo/z8dDB05TTR?=
 =?iso-8859-1?Q?V5oNBEYy857qMgZ1aCNgq2E2shOkYjvGq4XBsvJEVhAwYm7W5v7nRiV90G?=
 =?iso-8859-1?Q?OvnvEBpk+7tFeIapeV1fZa1QTAqEh5JqDOzq+7amzPg3nZ2/2+moODMFvz?=
 =?iso-8859-1?Q?60rY+AsOzxY7OrWmIFvQNeSZIzDoykqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?/J/pzHSB1UOYdFvsdcREffvaqLmtTso/v/jrP3xtRmsHBq7+aPaFM0S5wx?=
 =?iso-8859-1?Q?eJZCawW/EaoVO5UHRbCmqHoCsYa48B8bH8l1tJDARravnrDzQsCt0kl5L9?=
 =?iso-8859-1?Q?OPxepfYZ4OeiwGL6LkrXp9YffaHdfWqVe35hV+7U1yYWePbhauQB21qpDn?=
 =?iso-8859-1?Q?noOhNQQ7yuvRJ5TVNiceEok97u9MjZW5COAF8bl0uIAg6iT6RK4BLdGfSh?=
 =?iso-8859-1?Q?ZgekaC8x04EfrOIDC8vkoGUcm5v5AXiA2s0Z8bxf2v26APq/hh/GvGC91Q?=
 =?iso-8859-1?Q?SbGu+zUR8F/5YhpgL/1G03/xMchDq9Ns979FAzGHLmF8zm2uJObvBgv2YD?=
 =?iso-8859-1?Q?lOri59t4PahQGyijBxRIB1XL/GQTDPPiqjpgZW4D7tuNzdf5Xomwo6koGW?=
 =?iso-8859-1?Q?IR3CzxRnzsxLNSA+lEfX6P+GVCaMN1bszXyaIKmlBl10YSOzZ8Lj1Jo8pK?=
 =?iso-8859-1?Q?NSVJqJAiKr2iPkEE44OdqAIKYAqbJCbcyJyIU7lVYXYn1PM+RuSfgsdv8Z?=
 =?iso-8859-1?Q?EclV/pQ77ZA1uzEWZOURkJD15LvBzF6LIX0rDEACiX8okSXZvMcKBwDFaQ?=
 =?iso-8859-1?Q?rREx1JMgzLS5dsnvZ1aa86hTtAZ/Dn8XyCRpv/ehjqP78XtJAYLPTP8ofZ?=
 =?iso-8859-1?Q?UY3huwGXJmdgBsTZkOT5JBp+cIt6+z7VfvJIbERSwK0KreewT453UG5+GZ?=
 =?iso-8859-1?Q?ue45PjMzPeek8HgJ1aFx61L7Ca01a9z51H8x0Xpbwp6tF3BSNvJheLbXqV?=
 =?iso-8859-1?Q?KbvjLeIxLQgtmUcGHLiD3X9qIRg6bQvlJ/UEo66Gxh5MDAY2hW0ZCpZpX8?=
 =?iso-8859-1?Q?hePMy8FbfiSicZZj2/lw/ZdJWv3tyR9dFqAp5XNPFgVTbDqqUcPKGdtlsq?=
 =?iso-8859-1?Q?ZMOulH/1eWRoP0ETfEDB7yTXfauBEREhzoBhLcWbuKBs5QP76taw+ubGh4?=
 =?iso-8859-1?Q?S2LyUF25RA0g4vgZ1c46xOqK97f4d/rpMjoGmxG74I3sXi9djyDK9pdyRw?=
 =?iso-8859-1?Q?yM84sVYU9QecWuPONNnLEvCECp8V6T7sDxGy0X7SxC8gApGxuvkS/f9Rw9?=
 =?iso-8859-1?Q?oGF8Us8MyZZ09sP8UqmEte0ooKRmedGqyTeKQrerAF7E7C4GDaSp3EnG+N?=
 =?iso-8859-1?Q?GnbqV1LlLHZ1aU++CJ8XDB4S1bPCWDZeVr/vrBsUUvOfa08sIVM0RiMZow?=
 =?iso-8859-1?Q?++9a63o/4/k4IPn/k/ERQ84Ej4ikJDh55iUxq2jyK8WibE2bAqBLd8E43+?=
 =?iso-8859-1?Q?ZEHXZcz0tcTdKbVYljl6OpWmSsxJE1AgMZ4SzKRrcbd4+PHeSd8Sd5VTid?=
 =?iso-8859-1?Q?4ieBIlopnQYgEBK/LfrsU1eB/lpmSQBswvfFP5gpBHCoyLpCpwMfDT6h1a?=
 =?iso-8859-1?Q?iexL1RVbc5Ob50gNaRI5/SP8z1AJDs1KTVVXgv2kr4MGfOVMcRe+JOHuKW?=
 =?iso-8859-1?Q?KMC8unhX0MuFTDcO453EEcgEDTXZnhqgyI0Bg+bAMQ5fo7hM/NzLj6lnwF?=
 =?iso-8859-1?Q?AbQM8vOpRGzxE3irO61viyOs0ujLF7a9riqjyL2Tsyt2Wf4WqPaAqIf+Ow?=
 =?iso-8859-1?Q?cCX9QP4ZFV6//Np++fjrnZD2ZDzDpDjYMTC5hpvJJJFqhcuhwwhQPhpyJH?=
 =?iso-8859-1?Q?kS2wMG6VlDc6YZs2hGIQkbZo/uNFN8cM4BMq0KLhAQyQWiZJiDC319Fg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 084a5484-4f35-43df-a16e-08dcc8ef0495
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 12:26:48.0289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjAcjNMSbiVlSxbF+5dlwXY9A0vk3gh78dM42sxZIb6VGoZ79tMTevwwpuHqJZT0SJkPGkqB46rs8SD9NxoZ0B+lhyP7J8Ha3i8cQPR9Dik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6727
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Aug 2024 12:26:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5345

--alolf7r4k7jajlcc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [docs] [PATCH 1/2] doc/features: describe distribution feature
 pni-name
MIME-Version: 1.0

Quentin Schulz schrieb am Fr 30. Aug, 14:19 (GMT):
> On 8/30/24 1:40 PM, J=F6rg Sommer via lists.yoctoproject.org wrote:
> > From: J=F6rg Sommer <joerg.sommer@navimatix.de>
> >=20
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >   documentation/ref-manual/features.rst | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/documentation/ref-manual/features.rst b/documentation/ref-=
manual/features.rst
> > index 2ea946b31d..81f09f59d8 100644
> > --- a/documentation/ref-manual/features.rst
> > +++ b/documentation/ref-manual/features.rst
> > @@ -197,6 +197,10 @@ metadata, as extra layers can define their own:
> >   -  *pcmcia:* Include PCMCIA/CompactFlash support.
> > +-  *pni-names:* Enable generation of persistent network interface name=
s,
> > +   i.e. it's tried hard to get the same but unique names for the netwo=
rk
> > +   interfaces even after a reinstall.
> > +
>=20
> I'm a bit bothered by "it's tried hard to get". I could suggest:
>=20
> """
> the system tries hard to have the same but unique names for the network
> interfaces even after a reinstall.
> """
>=20
> Whatever works best, not sure it's any better.

I'm open for any suggestions. I'm not a native speaker and better in writing
code than texts.

I'll send a v2 for this patch.

--=20

--alolf7r4k7jajlcc
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwODMwMTIyNjQ1WjAvBgkqhkiG9w0BCQQxIgQgMQie9FHT
fXv0Bsp2kONfxDwE3JmCNhN9AzxApcFu9EUweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAXK8wJwiNzPwC+ldl4p6Y6JuooeFj1ze/VbPl3D4HzkgeDeUGWvotQHBux0PQAt5v
83Y2nPKHS0CeoKbTabl0MQr0/EehKs9CLVhAR+D6f1MGZEQYTPgM7iCB/M93wRjpHCxMzmPX
EevU+iEmGPoTBpgi2oSz7UaEJgGGt2pQdwSBpPwxw8nFNkKK/AWJHDbjHgnSfz1bbyNHHJf7
MsHEheBZLjaciD5nsnVpdFaN+sblAS5F5lSVn6thQlWfweadwlBsLSZ8v3AjsR6cReaZEVq6
UCue1iyojoFmwB7g3zOe7FrndAhCGiOTImB1X32hDsanaTcbEVsr49whcn+tPg==

--alolf7r4k7jajlcc--

