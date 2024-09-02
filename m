Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D469ACD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 08:59:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.102])
 by mx.groups.io with SMTP id smtpd.web11.34527.1725267560721452270
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Sep 2024 01:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=nM+nKfh/;
 spf=pass (domain: navimatix.de, ip: 52.101.67.102, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOBuERq5imj9scLDbbqoQnv9OKcyof9YrlkbX4UOwXAV5A0sjBKpEeMjLArN3lMhsJtrM5jnJSxfowMEeaRPW2JiBQ4nQmsgXqcEPShIKM2fXyb0Ayjgnw+JQAF3wd5vUJ+JqT80hy77iyk860dp3Nly1agvkI+mreOwphojWiWhUo9THQBibtDKDkSVnVi8LTU5x1neuX6hunbGXY8xEr6vY6Nnu6YwjyACaqpVv+7ma2RaiGydY0a7vYmJSMrSqoW9T9HqXLx4ud5HTKv/1jF5mRBNnx0nn1bt1rqaLY8nxlp09WBJatIRnjgQ6Ki4EAQsO5RmEaAq0ubaoIEX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qzu1BHLZFLwl2jUkgPhmsyPzAdyDbHwgzIX+zsSC/dA=;
 b=C9UBEC+Lq3KC2OOEuS1c+yITIVrtG9SMpb9vecMeGbGWiLCSHp4WwGvIoPeGD6x1Zz2otS8KakPzWTf3GGXsLenSNgmy8Y0ogS140JhQzr12xB1KvAa3uNywWsYADnDOJuZh/AGZ3QE179acxfLirV7M7S4V4xN3BOpwrS+zheQfdfPpoGyK+eiWfipA6J9XBwzL3bwhqIbKEXXRVgsmkPTs2/By6kett2p7zAI58Z6otVvGa29q5qLVXOrt4b6aDVg1b115VowsKaZ92xYAvWbI9NlJwxqUEjKMxQkimn+bgrA+4lJ3HPzPtYYVRt6ppwZPRKS5/eiEbR0qBfwh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qzu1BHLZFLwl2jUkgPhmsyPzAdyDbHwgzIX+zsSC/dA=;
 b=nM+nKfh/h5US+1tRBkxWd48epXARYiltD3dEVymnKHqune05aheY/FVGTezGIXlqZmdbLOF4wkh8ZpBtryYzivxdDhERwhjLV/yvZv2PKaG5hnsoik5ELcexZbcCkhrJbapxN2SQfyfaf+IvKwE+Ehwj6a6fFlDqMbw7PkdOtUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU2PR01MB8264.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 08:59:17 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Mon, 2 Sep 2024
 08:59:17 +0000
Date: Mon, 2 Sep 2024 10:59:14 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH] doc/features: describe distribution feature pni-name
Message-ID: <jxpkr6zfcyhqattfqxvafzkzfiouoicvnpwdgtacztrfdodb4a@smhc47c3enzb>
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
 <9275d1ee169aa794c789fd46d2e1f8f68befe281.1725088479.git.joerg.sommer@navimatix.de>
 <97f6df0d-8f41-462f-924b-5de4626eb26e@cherry.de>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="vuhmxh36wiq2cwkf"
Content-Disposition: inline
In-Reply-To: <97f6df0d-8f41-462f-924b-5de4626eb26e@cherry.de>
X-ClientProxiedBy: BE1P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::20) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU2PR01MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc32c71-6b33-4364-556c-08dccb2d8668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?HOHfn4pIuhzeJiPr1fjABXLS2O65pxjI6/NjzbdRtuI3eWM0xac8N85RkR?=
 =?iso-8859-1?Q?AQD6KR/ge7niHGGAzN0pA/OzU4fAZYdWzMXv2n4ElU99UfJauwjJXiecWg?=
 =?iso-8859-1?Q?GSD5pkLvLULCD2ToCgNJar089nEu118aqU2vCkl59qW1E0ibK+KEV+316F?=
 =?iso-8859-1?Q?KLl0ypqzKas3vSEip+QH2e2yoUVeu8FZTEcFH6m74bYCCAqAZBAmR5LmMJ?=
 =?iso-8859-1?Q?+4AE0e2faYDqnsxDubDjoTTtrPCig9+hXPYAhOLlX/q/GkW8NqMVtmZja+?=
 =?iso-8859-1?Q?dfKaRS1AGKh1AmVIoKbWK/Z0tXVBRn3mUCC23Xl1VsupFsa1EJisRc1pqG?=
 =?iso-8859-1?Q?VcWgo4d9PrjR34U2Yd2aGvNWkxcdUCIgQK8NpXG/8YCdZequy7jrL5+Jlc?=
 =?iso-8859-1?Q?B+BnrM3DVzgN3Y7Z9xglFGdYegQ4WUkNP2iWNtk37Fj2sVlhl0ChUx7bss?=
 =?iso-8859-1?Q?2a4QS/YA9aloMuOTpgp1+XA1HnhTVuMX6kTDUlLYNXci7XwYzKcaopgQbn?=
 =?iso-8859-1?Q?fTm561KDYNZjdEwrQv5zQgGPoHyK/NMyRjbhbQ3AkNucLFm7g2yGfXlzFl?=
 =?iso-8859-1?Q?zJa+oZfP3egPQHRP9X+4HKLcjkx5ATf0ug7kzMnBX/EeyKuJxzT5DALHq/?=
 =?iso-8859-1?Q?exze6zROK77RG3BW+IdcXwTW8F0IGx8tHLcLSS+yugqPNqSTZPkKlyOQ5t?=
 =?iso-8859-1?Q?8YC6blpPP6MeqYNmZuLCU0kdqi5JQwCC8vMh5t6EBy/3Lj3RYDnOG1Njgh?=
 =?iso-8859-1?Q?m4V9wkSF4qfIyoLEHr+563iPIeRi3iuUwLRo+UzurpIOv63UQpHoOmw+jX?=
 =?iso-8859-1?Q?StESm6KfTz4kSiScv3MvcBQm7pYzKktsaRItsyCP3P9MY9bQ93L7bIql1A?=
 =?iso-8859-1?Q?WTSYl3T2SU799pHmZa/8uKLYwn+681AME0gp1bDt3FQVf4EQCEUKjyz3Y/?=
 =?iso-8859-1?Q?uHWGA0pxBBEswtwP/LhW4/AHYpq0Lxwwi+EOr+3A4GbueWMKZ4vTFHLqF7?=
 =?iso-8859-1?Q?kR0PTl7rvfJSFQtnBX8wNsdbsHiO+CpmgvuKwyuk9war8BQrwctnLK69Rv?=
 =?iso-8859-1?Q?OMnIWiBx3UD0g3RPMBgVCigy/vrkLZN1sqUuPOWPNKX44cGDlycqUfa2AC?=
 =?iso-8859-1?Q?bzs5K3snZ2SLFHac9n2Ia5Ctc9FY3JcLD9JIeQpmDJmwZ78PD1ybPTL/aZ?=
 =?iso-8859-1?Q?v6yEXmvZMp2M4VqT4k/lBRv0EayZHvKpayAIAEjr7NDJl9QwkGLToiUOJT?=
 =?iso-8859-1?Q?oESIqrBFqzwfh0YVWdNBRso6X9hse2gp1vq58dwgp0EfjnD4YZeYV8FUsh?=
 =?iso-8859-1?Q?z2wnG8bpjUm75sjnD5kRP5FztsD4i20WmggaJImTbJPjXW1+lKGCjh8SfK?=
 =?iso-8859-1?Q?3iGOIFAiP7pRxldKWUK/viOc38yLHrtw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?NHJivvR7fuWYVgXARW5JdHFt1hpyTEKk1RNBYNddIEhr9y20QqxMMP/z0/?=
 =?iso-8859-1?Q?+MVe/6pUisxfZSskBn9XQl8nLkwH7tUkA+E2bT7HLbsNTZAJIs8bgfErPy?=
 =?iso-8859-1?Q?GjryeXksU5TrW2iq8LwmXOSY/2Cr4ycQ+bxwSXe22uFvRjMHzHoWSHjLWp?=
 =?iso-8859-1?Q?36KN9TzT+Gak1kWwdamY3xLVUjOegAcgiQFxIemOZF/AQnYEx4Zs9f8TE8?=
 =?iso-8859-1?Q?mciv+5DVLZ0GcVd1mynWZ6gOHZtxchbXBPZXySkm1tv7q0ahIWAFFyePxC?=
 =?iso-8859-1?Q?eg6gNAv+2pjez1EsWLJRqY1c0MooXfTck/RNIxibjhbLTn98XnIwFwFYY+?=
 =?iso-8859-1?Q?6h4FNWFZ3Mb+uNGKvgJM3dIei0ZAbD+5CbLZVjZLM4fmeVz7iI+IwYwnlM?=
 =?iso-8859-1?Q?jyUmvksTSr4g2Kn3QDS2IJ/F44+Vx5tsb33hABAmBDLr6zM981+aym7wLC?=
 =?iso-8859-1?Q?tBj79dv1wd83GnX+mByJYq6XX8pIkeEdhM/POdP14TQXhGZJ2/Tcnr3B08?=
 =?iso-8859-1?Q?1wZpw2LV5LQ9064e9N7jyFSEfgpuUkqwB+Quti7KFC7z3skuQNx6udSo5J?=
 =?iso-8859-1?Q?NjtLk70EVmBUhLjlCOEyAc69vHTzzoNFBa7U5La17CD7sEVHTYOLVhxp2H?=
 =?iso-8859-1?Q?ZIurAbbc5geswMpK7BKUkTlzXCC7DJYEG0msSRG0jT+l35+p8OtoR/Nm+R?=
 =?iso-8859-1?Q?CY1Hn+bhLI8tpUy/EYc1DBUBYXwOVl74kwvR3oAkjjtw3UPFdvvJXDJsKA?=
 =?iso-8859-1?Q?EZ8fdircgMNbQGUiqTkq/W8KzZwhxkTxyvW39+ki9z4bCC6T3gONSxHFV4?=
 =?iso-8859-1?Q?FlW1jIx2YbjEB0ddC9gzumEtMPxBA9efsAWhbDfVXEPUJpjv3pJTDPXD3C?=
 =?iso-8859-1?Q?xvcGK26D689xVGmKlo8laJQ+80Ubjrrz7TtTSwpeeh8WY31BOKgM7gVh26?=
 =?iso-8859-1?Q?SviXup+aR7K0PRd7SVqq8NM4gdpiV6a+MCHeDIfsVOC1FDM2Dp9vJFUI27?=
 =?iso-8859-1?Q?XwLMO11JeDXjMcW71z/TnWf28zS01/7IzdBq1aAAqQz9zkBN12XE72m1dY?=
 =?iso-8859-1?Q?zQM+1/jvWiAu3cO+jN9wudvDGTwCE42NtEw7ZvHfMwuGRZ6PFXNB7+991J?=
 =?iso-8859-1?Q?EHsTrqEoQ/WAf7eftVF4OdM7Hkj4EXsxEKlEASh2LEIQTo6Gs7L7okNAnW?=
 =?iso-8859-1?Q?uafgWBDQ8vHY+iCWOoyiLOcVDuKwBR+tfFJAA481HVCrnXIS1o9ExF6lpj?=
 =?iso-8859-1?Q?AkDTgzeMJnhVGn+JLmEXxUfrX5KYhU/N+SEq93v6fPu8SS6FURkZnfkITT?=
 =?iso-8859-1?Q?dXAF03LzBKQ5VMNjhz3qjDHK1PO7DU9NTvfjG6soEhVNLBBSMnQ9yo6PuW?=
 =?iso-8859-1?Q?sNSu6vn4IP9C+m5OI4Lk/2eD6VgMjPDFf/zybDEjODPyZfXzlf/SYso810?=
 =?iso-8859-1?Q?bowPOaXCDZXUbRpDxagl8Yi1WQgs3Zii7IwAuMCxJXJJ/pdu3+mcQWolPW?=
 =?iso-8859-1?Q?7lWZILw87ca/WT2MUPDgP9y2xI1eZe36mJZ+/CamK4gLjnMemcO2E5pyCV?=
 =?iso-8859-1?Q?0htz/Ym9yDYiD54pcRXKrQQI69hiu/qoA/g92jYgNIq+PTt3YJLblxjR10?=
 =?iso-8859-1?Q?2WBIqoJcpy22I0wk90a4Dq5MhAjbnaiaypsWs4stycy1jzr+KtSW2kXQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc32c71-6b33-4364-556c-08dccb2d8668
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:59:17.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGC9Y7MxWumo2nHCuMFbqkfGvqjgPnjoHFTxl+HkfD58ZmR73crcaPKzQK5qU0XliFxs6GFSCVXwcuhdGOS4tToHP4NHPooCPW3xIf/cObw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8264
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Sep 2024 08:59:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5348

--vuhmxh36wiq2cwkf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] doc/features: describe distribution feature pni-name
MIME-Version: 1.0

Quentin Schulz schrieb am Mo 02. Sep, 10:42 (GMT):
> Hi J=F6rg,
>=20
> Please try to add the v2 when sending the second version of a patch so the
> maintainer doesn't have to guess which one is the latest from their inbox.

Yes, you're right. I've realised it the moment git-send-email printed the
subject.

> Also try to add below the --- what changed between v1 and v2.

Is there a git-send-email option to do so easily?


Regards J=F6rg

--vuhmxh36wiq2cwkf
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
EzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVU
aGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNh
dGlvbiBBdXRob3JpdHkwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCAEmUXNg7D
2wiz0KxXDXbtzSfTTK1Qg2HiqiBNCS1kCdzOiZ/MPans9s/B3PHTsdZ7NygRK0faOca8Ohm0
X6a9fZ2jY0K2dvKpOyuR+OJv0OwWIJAJPuLodMkYtJHUYmTbf6MG8YgYapAiPLz+E/CHFHv2
5B+O1ORRxhFnRghRy4YUVD+8M/5+bJz/Fp0YvVGONaanZshyZ9shZrHUm3gDwFA66Mzw3Lye
TP6vBZY1H1dat//O+T23LLb2VN3I5xI6Ta5MirdcmrS3ID3KfyI0rn47aGYBROcBTkZTmzNg
95S+UzeQc0PzMsNT79uq/nROacdrjGCT3sTHDN/hMq7MkztReJVni+49Vv4M0GkPGw/zJSZr
M233bkf6c0Plfg6lZrEpfDKEY1WJxA3Bk1QwGROs0303p+tdOmw1XNtB1xLaqUkL39iAigmT
Yo61Zs8liM2EuLE/pDkP2QKe6xJMlXzzawWpXhaDzLhn4ugTncxbgtNMs+1b/97lc6wjOy0A
vzVVdAlJ2ElYGn+SNuZRkg7zJn0cTRe8yexDJtC/QV9AqURE9JnnV4eeUB9XVKg+/XRjL7FQ
ZQnmWEIuQxpMtPAlR1n6BB6T1CZGSlCBst6+eLf8ZxXhyVeEHg9j1uliutZfVS7qXMYoCAQl
ObgOK6nyTJccBz8NUvXt7y+CDwIDAQABo4HyMIHvMB8GA1UdIwQYMBaAFKARCiM+lvEH7OKv
Ke+CpX/QMKS0MB0GA1UdDgQWBBRTeb9aqitKz1SA4dibwJ3ysgNmyzAOBgNVHQ8BAf8EBAMC
AYYwDwYDVR0TAQH/BAUwAwEB/zARBgNVHSAECjAIMAYGBFUdIAAwQwYDVR0fBDwwOjA4oDag
NIYyaHR0cDovL2NybC5jb21vZG9jYS5jb20vQUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmww
NAYIKwYBBQUHAQEEKDAmMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20w
DQYJKoZIhvcNAQEMBQADggEBABiHUdx0IT2ciuAntzPQLszs8ObLXhHeIm+bdY6ecv7k1v6q
H5yWLe8DSn6u9I1vcjxDO8A/67jfXKqpxq7y/Njuo3tD9oY2fBTgzfT3P/7euLSK8JGW/v1D
ZH79zNIBoX19+BkZyUIrE79Yi7qkomYEdoiRTgyJFM6iTckys7roFBq8cfFb8EELmAAKIgMQ
5Qyx+c2SNxntO/HkOrb5RRMmda+7qu8/e3c70sQCkT0ZANMXXDnbP3sYDUXNk4WWL13fWRZP
P1G91UUYP+1KjugGYXQjFrUNUHMnREd/EF2JKmuFMRTE6KlqTIC8anjPuH+OdnKZDJ3+15EI
FqGjX5UwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
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
ATAcBgkqhkiG9w0BCQUxDxcNMjQwOTAyMDg1OTE0WjAvBgkqhkiG9w0BCQQxIgQg059LTNkp
36fZm+snaTcTT/soBbUIwTkkNhyg1OCIzB8weQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEASpkLnmKeSUGgqbf3DAe2cqW8GK/gV8jox57bo4KasLNf573BJuELxUcPE6L/kXmg
dZR13qCyXI1XMxo8/IuJooWVVLuDQdscdTCaPlBPuyxRtCIScnLzpNVnwQvFwlRSdyznOPcD
ZjF5zzLq25DP9xOP+AsVqwlda4KcEzVn96uxTMgtpXKaRDiqO4P1e9j2cb8aRmvdD5omLSJW
a8aZWhPyuY3yPqw5rpfKOEJlaxvnBFOHLYazZXT9Nmc+9sldPzQhDgjvw/xw9fKp3B0PikU5
fwnLh8uuRZxFUkyV8ys4zzd3qZWnMMzK+GgeFZLqIhH71naEGXlgapKSQ5SxHw==

--vuhmxh36wiq2cwkf--

