Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05899CD4F24
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 19:14:40 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.100])
 by mx.groups.io with SMTP id smtpd.web10.58894.1725477269075362809
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 12:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=lJ4vMPV5;
 spf=pass (domain: navimatix.de, ip: 52.101.67.100, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPTkqYXgWBe8Ikt6OhxomB76k+yvvTglSJ4bOFpKd3vxEz360i5r1JgOTh0v3BW+QP6z6GE7Lo6iBwq7PbDF+L8NPx7zauJcc2ezvswunss2ubhl23yz5irIC0XNBzfx5u5cWhtEcbAP4CnOQT/bwLSi3HbgIQhxwXnhIv+y3z537XC0wmymTOsPJxpl4sdmX071uYTMdbUKDCuCn0hnTRbkUt8MvKg8JYjh/b+PQcOVTn4Xw7IlvYEmxxvWGdSoyHLv1ozJAMRSYWG47dKBMogkPOYC2VfZmT4gFMFLsJDYLa9US4D0j47A9dzRzA2FWe4G/+VIuJCYniucJz9wkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPf93tc81Sb7ZL0p60EGuFfjiqnLkfhsJgbeztaw6wo=;
 b=WrY51cdXrE4EfBsoQYXoCSeG9jNKJU4UUjPyik2EwIIm6+uL9HVeyImXVA+BSFdV4wDiv5Wxs9WSiI1Uka/CpytRg67niZEB4zsiKY5q1fgqdTTTSAjeguN8H6o47Fvv3XaQkvb8fLdu6RdIdmeZPoGK2N5U95ITK/iTbTlnptciBH50KzInCFrIUzC5QNUvXby1avuyv+7HPIfVMemd3x7SB9Y08gj1hJheeIV3ZbYp2iAeqzOrOOhO5r8af3PhZO3vK+RlO4DFUDAyFqDzYlrJQJjPHCT40oCw9wWK6wc7Ed7ZCtROLSOOgFM83iQ+xDJdXAk/Hu8+4dO1D2Ta6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPf93tc81Sb7ZL0p60EGuFfjiqnLkfhsJgbeztaw6wo=;
 b=lJ4vMPV5OA3KFuuvC8OJ1WCjUsprOz5gqYR6DB3iG+9QufeTl4EjCKZURe9Gmb5gEXAO87rx0ozM3N6cfUtQq/zaGZ2i+kubu9VdrMmH3mECdyoP5Pd75HpzPMSUzJTTg0yT+MuQQl9mPSGcC8CTa9jsHoAHgrh9QXeV0bMzp8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI0PR01MB11439.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:264::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 19:14:25 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Wed, 4 Sep 2024
 19:14:25 +0000
Date: Wed, 4 Sep 2024 21:14:22 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: twoerner@gmail.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: update VOLATILE_{LOG|TMP}_DIR
Message-ID: <a4n7gfwmk33xqqafnrj3lsubbaxou4b5qamxdrjhj33ljy3hk4@sa2wjiv2eipb>
References: <20240904172748.18526-1-twoerner@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="gvkcinb5udrhwwql"
Content-Disposition: inline
In-Reply-To: <20240904172748.18526-1-twoerner@gmail.com>
X-ClientProxiedBy: BE1P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI0PR01MB11439:EE_
X-MS-Office365-Filtering-Correlation-Id: 12615d8d-ae69-4d6d-85fb-08dccd15ca4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVlhbXdiaW9ITjNSUTlHU3FoYVliZ3U5c21ybWFSRGFwRFAxMERuVFlsNEdm?=
 =?utf-8?B?aTROWmVXQnZOeU0xcHNJSXMwT3pCTkdRc0Q5ejlGem42TUJvdzdldjNBNnNy?=
 =?utf-8?B?NXZRSUFKWnBtUnFTdFVIUDBxTmszSnRtdDlZZXR3dTNuTVp5L3E0NnpjVDZ3?=
 =?utf-8?B?VTlSakFQV2xsSlB5VDNxVWJISnJWWmFGVE9NcDBBNnZEcU9zbFRETkZrMFFO?=
 =?utf-8?B?cFZSVnpvanE4YWUvZmNZMStMYy9rR1NmYkNHRlJOalI2VnlmRTBjTUp2ZVIr?=
 =?utf-8?B?SC9QWXhWcVFjTE8zNVhvTkhBOXBORC9SL3JzWXZ4QzJsYUE3RkJIOGpXM1NF?=
 =?utf-8?B?Skc0SCtQSmpuK09UZWdjWERBWWUvbmtiTWZVMWhJUWlOTTRxZWhaclpMNW9E?=
 =?utf-8?B?SmU0eTZvb0F1WDArclJ2cVl1bktNL3VsV2Z3K1VsTVJ3dS9jcUM3MTQzMVVP?=
 =?utf-8?B?elh2Q2ZsVWdsbGd3RU5hcmlQTXBvK2NoT1JPK2QxUVNWYWJkTjZiUHhBek9n?=
 =?utf-8?B?MldaR0lRMmFpTGZJUkFhanYvMU9uOVFxQjdleERXT0pqSHpVbE9mck5ra0hU?=
 =?utf-8?B?VWVmRUEyUmd6SVBLc3dLK1NlWk5jY0lVZytMcDhNYUZ2NjRubG5NVFdzaCtx?=
 =?utf-8?B?VnhtYjByY0p3N3JkTjE4L0lrTlI1bkcxMG83WGpJc1RPQUhGdGZqRzBqSFYx?=
 =?utf-8?B?ZWp5Ukk2alBSSjQ4elIyYkZVelp2VDFlTCtUaHdyMnY4bG1EM2xZdVN5OVRa?=
 =?utf-8?B?a1g4dVVQQ2g5c1A1bUg0QkVTM3NqWWR6aG5QcE1haGpFSXVkOHdMN2JYT3Yw?=
 =?utf-8?B?MHFHZUtCQ3g1Y09kS2JiSmVuci9NdUVnb0ZUekhWNlZpb1NxV3BLWGtsZUo1?=
 =?utf-8?B?Y0Roa0RVQ0VVR0pXYitjbHBrTnpXc3JOaWw3eXRpQXBQUXZYWlhGWmN1cmcz?=
 =?utf-8?B?RHROV2VRUEtRQ0s3ZXlkQUJsNGhrbFUvWDNiNzFKRFJINDhjUFRwby85akpn?=
 =?utf-8?B?NEUvYklvaFJEZ0VNTFRuK0grd2tlQ0N4b3ByNjhDMFcwWWgwTVlqN3A1bUdr?=
 =?utf-8?B?WmtFSFFFdHN5aGVjMkUxVjMwZE9pU1RTMWVySkJQNWkrcGpTTFIyU0QzOGdU?=
 =?utf-8?B?bnhVTlFESEhYQXpvbTFxS1NYRjkwTk9odURIaWtBalBSODA2d2d4cDJjV0xJ?=
 =?utf-8?B?VWZFRjZab0t6Q1gxd0xxY3JhS29TWG5ZZ3lmbVpaNDZlRG8xeXl0cmxXZDdv?=
 =?utf-8?B?U3FuUmlQVUE4bWR1TmtoWkZQOHlOY0VETHViSnVKWFVPcTlsano5VmlrUHE5?=
 =?utf-8?B?djVTZjBpNTI4U2xuaStqUGFYMFhKVFhYaHNqLytadXUzRXhyNUl2T0tnc0lu?=
 =?utf-8?B?MmkzWjFqS0dLUFA1VWMwWkJQUVdPRjBJNEtpdnlGei9QWml5M1RxbncxSjR6?=
 =?utf-8?B?L0lDd2JXMVNtNUxDMXM2NkRMR3NtTUpXejg3NWQxeFBLNWdIMTBsb0JsUk1O?=
 =?utf-8?B?ZlRTalRIbks0TnV0OFFycHU2aXg4Ty9iT1N4ZVBSUHd0dkNsRkxycU1PbEtn?=
 =?utf-8?B?RmdUMnRUbi93YXBvV0kzYjBRZS83bDUxL3p5dW94NHpSRVhIU3ZCclFSdDJW?=
 =?utf-8?B?K1hERlZXTmZMUFhNTGhUaGNUWXRiTVkzaThVV0RQRU0yLzF1M1p0dDFFQjFu?=
 =?utf-8?B?ZHdTcWx2UkJHd2Z5WUxtK0hmc3V0UUVHQkxCQk9jTUczeDhQcE11UEZndVc2?=
 =?utf-8?B?NlBVRFc1eFRYMmhUd3N3Y1ltUDUyNGZEbFNueEkxMXQweVkyZGRCOFpaSkps?=
 =?utf-8?B?ZUJOaHZhSjlQa3g1cDZCdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a0VXQ0hHRStpd0FtaFp0QTdOcFRBSFIxUHZqcXZ1RzJ0Q09RWjZsMzZobmVG?=
 =?utf-8?B?RHkwRU02WmgwVlQxOXRIM3pQV1NQalJ5Yk10NUE5Zmpwb1h5RHZZN3puQnBB?=
 =?utf-8?B?Rkp4MUZQU0dKeXZvNVhjbUFoQ3NUTDVoSHI3bFd0TnVERWE0d2pnanI5N1k5?=
 =?utf-8?B?TlRhYmVJQ2lnRDNndjJsSi9zWUdDbktRRDc0NVFudEZOOVlDU1hwVXcxQ25G?=
 =?utf-8?B?bDFoOHJHOUhnbHFBUW5iMkpFQ25pSmNId05tcjIzWmpQZ0dzc2JsRFc4MjJr?=
 =?utf-8?B?NmNONE1mTWpxT1lRVnlGTCtCSlU2QXhJZ3pyMHF5cHJSTFVxU0l2VjRIbHQ2?=
 =?utf-8?B?STcxZHJWT2xwbHUrWUl0UWd6QmxuTFV3K0hPQXRjUklFN1pBVW1oVWdTN3RF?=
 =?utf-8?B?anl2UVRCbkVtVU1iL0dvbzhSeHhPMmZLUkMyclpFN2YyMWJHZWNXYVEwZG5L?=
 =?utf-8?B?NWpnaGRhT003eEEwSnRCYUtka0dmaGZCRG1lTDJQQ1AzZWg5R05VaExZTWs4?=
 =?utf-8?B?WjgwTTM1cGlTc25HZkZiQ1Y0eU5hWVREaTBBTDJWdjBjanRuZEpoMWlvbXc2?=
 =?utf-8?B?TWwvZ3VCUUJyOHZzOEFNd3BOQjZZampKMVFMNDI0OEpUODg1YVRoN0NTYWJS?=
 =?utf-8?B?QjBpR3hPRGVLZDIxekZyYnR2d0dKTzBEa05yUFlWbzhIOTdyeHI2UWk2TGxU?=
 =?utf-8?B?NmIzdjhGdzNwZEVXZVNDTzZIZWthWS9hWmwzdk5YN09ob3BlRmI3bnpNUEZU?=
 =?utf-8?B?ZzNtaVgzU3pESDRnNmJtYktSWXowdXpJbzdJK3JweVZQSzFsWEN0VldxOTZQ?=
 =?utf-8?B?Y2M5bjNGUWJhaEo1M2ZuSGhWdVltSzRDOVpKN1hxZHBldWdDTTlTN2s2NmpG?=
 =?utf-8?B?MUFwWXJZRkdwRndGUmEzTXJOdWVINEk3NGRkVGpTcmthUjMxd0hkQmpWRmFU?=
 =?utf-8?B?RS9FaGh2V2FOZkJCWW95ZGNBaGwycWNnQjk2ZjZGTGxoMkg4Nk82VjVDQ25S?=
 =?utf-8?B?b1dCeC8rS0VBNkM0ZnArSGhvOGZHODZJK2RkRXg2dGw3bHVXTDFCclhnNkJp?=
 =?utf-8?B?eGpQUDRacWdoVExOZ283UnZSeG95OGxaQTRUNzl3bFJjVUFjRWxkeHk5eTl5?=
 =?utf-8?B?YWVhUFcrVi8zU3lySjEvRlI4UUZFZGdHZE5uejBlbWFMZ3FEQmNZUDZGWDBN?=
 =?utf-8?B?YWVqb0RBVkNiRXBhcEkxZE1DU1cycWJzNk11SWhYS3dXT3VVOWJiOEFjT21r?=
 =?utf-8?B?ZzdpTmVkOE56clltVmpzQnlaVmFJOWY3MWpLTUhmZGwxRkE3dWpqZUZtR0NS?=
 =?utf-8?B?bWhBRmFPR0VTV0xxSWtrTForQ1VrZTRJaS92VUthTHB6L1o4Q01oc2tVUmNk?=
 =?utf-8?B?TjNXNU9ka3RsNERjYzF4c25IRi9hdTZVNnlJRDl5UnlYdytoOXB1VjVIV3RD?=
 =?utf-8?B?UHp2RVd0cmpuNlF0T3labVZsdmJMMDhzSVpEZ2pJRFVKTVU5djNOT0tFWEI3?=
 =?utf-8?B?MGZGdVg5d0FnRkd3MHlZUkJ2Ky9WbDd0Y0tZb1dSRS9CKzZ6RXVzNjJERFVR?=
 =?utf-8?B?NlZqWW1hOG9NQjdLc2dDZnhJMktpTkM5bTNUOURWS1hyODBmZHgwa24rNlMy?=
 =?utf-8?B?bld3OStUYzVhT3prUlNsenNVSy8rZXNMMDZOaEVEYms1VnJCcFFDd3VMdmcv?=
 =?utf-8?B?dHM1Q3JGN21MUFAzeVpFWXdwK3BDUUFla1hhVk0xeEdzN1JidTE2ck9QN1JQ?=
 =?utf-8?B?UlVocXplN3JxN3VpZTB4N0V2WDdVU3lXZUR3MDZHc2prcXhFMWp0Z0ZPelUx?=
 =?utf-8?B?dm95dlZrc1dTektmL1lvRnJMaDFVdjlFcDZvWDB4VU1tdGJ0QWpxWmlXVVRl?=
 =?utf-8?B?bnM1eURLbUpLRk9hU2plUUdwZlhnT1pJVnR0NjhPQUZuTEh3dUE3c3BlL05D?=
 =?utf-8?B?b2ZSV21rN2NVQVlST2g3QXJ6NHhyQWJXdFJjbjR0WURkdFM5UU90VEJKREZo?=
 =?utf-8?B?dVNjQjhHdTFzVERnT3RyWURLWTlmZDRmSENkbXVlcnVHb1d4KzZpbisrTzdC?=
 =?utf-8?B?L1I2eTBvUDdURHZldlVVZ3AvWUVRQW15NWhvUDI2dko3Tk51b2wzMkdlRDdl?=
 =?utf-8?B?akk4M1NsU1h5NVFVK2lOUTY1dWJQcngxWGhnUWtDL09yRk9oZWJTNXNFd000?=
 =?utf-8?B?WkE9PQ==?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 12615d8d-ae69-4d6d-85fb-08dccd15ca4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 19:14:25.2737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2lVN+QJRWvHeTniwyN3EDaBbkQXTFvi9Otdrcshz9wVKXUW6uqN7ujsKoCoIxf1vD9pEmYjZ3gAMCdeb5JRnOTclTvF0Se817cE1LyKdes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB11439
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Sep 2024 19:14:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5352

--gvkcinb5udrhwwql
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [docs] [PATCH] docs: update VOLATILE_{LOG|TMP}_DIR
MIME-Version: 1.0

Trevor Woerner via lists.yoctoproject.org schrieb am Mi 04. Sep, 13:27 (GMT=
):
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/docum=
entation/migration-guides/release-notes-5.0.rst
> index 800ba20a27b5..191debd0174a 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -335,6 +335,8 @@ New Features / Enhancements in 5.0
>     -  Add minimal VS Code configuration to avoid VS Code's indexer from =
choking
>        on build directories.
> =20
> +   - VOLATILE_LOG_DIR and VOLATILE_TMP_DIR were removed in favour of the
> +     FILESYSTEM_PERMS_TABLES mechanism.

Would it be possible to expand this a bit? Like =E2=80=9Creplace VOLATILE_T=
MP_DIR by
=E2=80=A6=E2=80=9D


Regards, J=C3=B6rg

--gvkcinb5udrhwwql
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
ATAcBgkqhkiG9w0BCQUxDxcNMjQwOTA0MTkxNDIyWjAvBgkqhkiG9w0BCQQxIgQgTStRBgqc
GlLP31cVTJBFFTQ8aIO6Ghvvjiypzkc/JBUweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAgW395AY1M7EokwoUKo0KRNSB6DBzo5CsNR2p1vhnL1BqvrZ/WOkvp9VxCOsR78kM
pPnjmuGvA2t492bnqpTDi36oxMhBhNXjFifiemT2HBKhrq5KcTp0w5ZMjLu8T2WQZsqJVMQe
hbK1CKpGPA+ZnEf7OFuYQR7Byq8e1+5AHmBrPJOhQLfvJx/K+Bm6YN4lB1V3aWlYEOK2ooF4
eef9j6R4EH4lSm+h0MhSTIcigRmot8HRO+mrZB4MIOBOvBm/i6MshDbFOpTgHrh+EfjP3u5G
1dwocxBKFuxxk83LY2JUYhun/475/N+AdlYdXMuRWGcB9l3r4FxBixYU3LWBQg==

--gvkcinb5udrhwwql--

