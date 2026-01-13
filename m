Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7E7D0C85A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:30:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56724.1768303846075254103
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ETQGsHZ7;
 spf=pass (domain: cherry.de, ip: 40.107.159.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q18twHjxXy5JvwuIXiZRt7GgieEJ1P0Op/jMs2jLomQeZz45Su0lxgEwODOAVgcex9J9Qiat8mr096s8N5Mx92Va5++laRJrEvugOwmpj7kni7eyrcqUs58gmnpaX7H8AwwhkL7UlTxCM/adS4Tx5dclp+26EgjVyMghag1yJ4m7sf48jNaZjgOYFAj9TShXv9tvQWbmL7KdogCuF/tSQarVPevw1yRMGZ3Zeg7/F3/HXCS26t/NH3j0487I0fojNaDHIYANQOsjIwi7ZydsysbOMpnkYIeRKVMGmwZLQhQIQWKQaaZu7WXU+5NpNBFGkjVgozMI5+LDFMPQ8g1gHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nFfk9BrLt9g4bFpSNN11o6Ta+oYo7SDp8G6fMI7ixk=;
 b=h91yEj8+mhPFXq99mJpbC9s2zY2s/Flz4B2al+PjWeWLMHByA0w0jdboouw6zY5n0FaI0J1GO0HNK9+AtTppnAUoqEy4DbluJX/XWZIZPjgen//oBil47rgZElVwsuacie1/mYfpVy5nMeVOCLT20erIDOGsqMlHC/8Aw0iIGZqrR8Ianeg7FWWNoBTfQnCIhjJEsm3+/1i9K4rfzqiGcGCuvc584RuOYyMuNloJEy7uBD3Oc8XuiZUbDytJ8eurWjQNqduKvHqJPwlCZCRt97L+ZQPK2X2pFwHqXu2alcON2DAZJVbGdlQkgFgE67/Zc88nOz/fx22ipmvlrXh/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nFfk9BrLt9g4bFpSNN11o6Ta+oYo7SDp8G6fMI7ixk=;
 b=ETQGsHZ7dFEQpfXRrG4AX9cgPyvoLOmy66ZCLC01BZ9wgAFB5HyEVH/w5f829YQZLeRutMu7PGK8YwAucLNKZTXKi+HCJGDlv7FszoqeCT6/1aAGiZ4EJXQM++O1tilgWkPlG6Ym55kCQDhxlGCcvNv5Ft8BjOGVU8TrRq//3KQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:30:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:30:39 +0000
Message-ID: <d2516cf3-669d-4b82-97a1-7fb2674e6f9e@cherry.de>
Date: Tue, 13 Jan 2026 12:30:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 07/53] dev-manual/building.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-7-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-7-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad00810-87ec-47df-83a1-08de52972dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0kzQ2N5Q1dJK2hGdlh6SjhZVnFPVTRoRGpBZUZlQ3NkRGVmWU9VMVVsKytp?=
 =?utf-8?B?RkExNFdEMW1xWWZidk5DK0pjbUw5bE1pOTlqekZwNmtCNVNHcDFBNVg4Tndj?=
 =?utf-8?B?b0thZUs5L1VoSFBkZ2h1RDdMei9VdHJuMUJhd29qOWdicndyYlZYUHVydXVn?=
 =?utf-8?B?YmRnVXhkVWdDS1h2UmVFanZsSzVTZ2ZTUjFPSmhteG1sejRHTHpTcjFCSjBm?=
 =?utf-8?B?MlVjWisrNG81Sys0NUJod0FLRlZ5Q09TbzF1YURLa013L0ZRSjJCdm9kdTVJ?=
 =?utf-8?B?TWJBNTkwSnFZTDErd1dWbGhEdUx3UVJuMTRuQTY1QkRXMjBsSFh3QVozS1RJ?=
 =?utf-8?B?VlVBT3A2NmluT0s3U0x6dVNzTURrL09kL253WStZUkFoYUVpdjNTSGNFQjZI?=
 =?utf-8?B?UmYwOElYUUZJT0xnNW80VVN0SFEyaDNkeUkvNzh4NTd2SzRFMlU5MzVoRnp3?=
 =?utf-8?B?czlPNDdtY3UwT2VBQTlsUGVtT2tlY0VyNlE4QVliOERZSzlLQi96UGt3cTI0?=
 =?utf-8?B?WnpUczUxVzl1cGorVmZWdXk2eERLMVNqSlpac1pEd3NFVVV5bUhJK3FUNk1U?=
 =?utf-8?B?Si84WTdWZGhxUVV3NHVkOXZVb05OZjZuemVLTHZXSzZCVHRyalpJZ3J5Ui82?=
 =?utf-8?B?aURJT012UWEwOXQyZlZCSlZoRVdCNkh5dFRYUEwvY3RaZ3hvUHNiVnBIQmdv?=
 =?utf-8?B?QzBxTzlZclI5U3BnL243Ukl5TkVWOWs4RUdMY3B2YUVFVXUyTW9yR01iZ1VZ?=
 =?utf-8?B?MVd1eitwRkJvWUEvS1JKTk9ZampFU1lQTW4xdTRLN2tCN0JHMlNJM3hTNnpy?=
 =?utf-8?B?SmtraWZmbXNBSlUybXJhUjVCZWJWV0RBZHVxWXl6Q0FsREpNNTBJMkRUSTdz?=
 =?utf-8?B?Um9kSkVSYVdvOE1YUCtrTGFrTERReXV3UE1aMjB2RWZ1UEVPcStOd0VJUXlT?=
 =?utf-8?B?L2hBcGVvamwwdGVBRUJRN3BycWxydkloc1hlb3ZCeTVDMkpQSFZQdjlHOVBx?=
 =?utf-8?B?cklUT0hNdkJpWk5FZjk3N1hpOFROY013MTYzZ1FRVGxjRExzMGovOGJNWi9T?=
 =?utf-8?B?OWkvVWx1M0FJaWN4ZE41T0Zla3g4U2NuV2tmZ2U2ZUxMbzJkSXBTaTRJaTdT?=
 =?utf-8?B?cE0wZnhnSlBKb1B6UjBqdE1ZeVcwZUU4dmc5dnBldDBQdmcvRGhOakNoeUQ2?=
 =?utf-8?B?UUxURnZnSG5KQXViTGRRMzJnYjBaaFhjUlA1aGdKUUJKZ3VJcVZrdDFiME9y?=
 =?utf-8?B?OWpTMFdic2lyUFk4MEtRZzJ6T0VwbFZuc01Udk9nSi9Wd1BwZG1XRmlxS2JB?=
 =?utf-8?B?SjJKSkc1VHkrWjh1RTB5Ri80Nm0za0kyVEFUVXVMR1VKaklob1RSczhpNExr?=
 =?utf-8?B?eUN0M21FenVpYlYxNnJETllaNWExYXlOYTllWUw4UXRhZ2NlVjZQeEtuSlZ0?=
 =?utf-8?B?VWRieTVhdXRBVWZabzM4ZitlbHdncHAvUURqcm1WSGJYM0JET3NBeldwaVNt?=
 =?utf-8?B?cGpFYXlRMDhBUjA2cWE3aWk5WDFNclpBYnZ4ZHFhZnpsNkZpaTlNVENaY0RV?=
 =?utf-8?B?ZDBLR2lvTkVIaWM3eXM3WVl2UFNFb2t6dWh5S3B3ZTFMUkJxTkk0aTF6bUJB?=
 =?utf-8?B?Nytmam9TMXlhR0xOelRGYWZPT0xaRVZBTkJkWnRFMnNIYVRBc3Y5aUNQemtn?=
 =?utf-8?B?MnFGT0VQd2V6QzN6aytuWWYwdGtRdG5idGFKSGF1Q09xZ1diQmpySUpxNHB3?=
 =?utf-8?B?b25iUjdWVkRsbmo2Vkhha3lwb2VtSFBGV0R5bE1VVmV5aE04T0NTWndwaUp1?=
 =?utf-8?B?ZGttT2oycytEQUxrWGFIZmNsenNpQVNOSHVGVmlUaStCaFBhU0c1T3ZaMFA4?=
 =?utf-8?B?UVcrOWY3Y1E0RndlY0xFTkU1YnRJMUxRTFoycHI4Q0FrVVRuRjdnOVdCOTBF?=
 =?utf-8?Q?GPiefJj/8Kq3TcspFKfbmVJgVcfXug7i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFFmT2hSckJWVVhZTHhEZWJXWGRweWQ1SGdad2tuUERUM0dSWEpiTGxmU3NC?=
 =?utf-8?B?S2R4bFU1dVhsL1RMTWRkS3d6SmNTdjNwMWpybW5QV0ZGY2xXUzliOGtTSW0v?=
 =?utf-8?B?bzhwQU5kZWNpbjNyYnlabWUyVmpPclNJckxYd1Irem9EcWYvekgzODhBR0VD?=
 =?utf-8?B?cmdObEV2bnlRcmtRRGJsLzBHNklnNWxQSXRqYktFb2pCVUN1bTljNmJYWGpy?=
 =?utf-8?B?d3JXaEZrK1dJVkdSOFhHOWY3MjZxcVA4WnVwVFRUNmVyZER4RGhGMVltRnor?=
 =?utf-8?B?T203bk05U1ZOSG5HK21YbElZVkRmSmRRVnJlSVBTckRRTzRZeWlTRTE0RENZ?=
 =?utf-8?B?aENkMTR5ZjhENmNqTytmbFFuRldVL09Hc3hISStTdU1UZ2s4Vm9EKzBLeVIw?=
 =?utf-8?B?YXdGZ0tyWmVPMEtjR3A1Ui9PVVNtY0RsbElmYmZNcmJjeUQ4N1Z5WXFEYU9l?=
 =?utf-8?B?RGlNTktYTnMrQXNoUFh3REpxbWhucHJobXJOMEJlNEpYa3RTUkcwWTB5elFN?=
 =?utf-8?B?Z2h4MTRJQUtUM3FRZHMzSmJjNm4venoyS2QwRzltZng2N29xOWFkci80THpZ?=
 =?utf-8?B?TzloelF4bW9ZbW9YdGkvSER3TXBpUGFyMGdVNEMwZnB5c2xUbHlRYlBKMHZI?=
 =?utf-8?B?SjJvNWM1cWd4MGVJRWFEQldqbURicDI0QkJCc0x2Ylp0RG92Q1pQT2lFdlJx?=
 =?utf-8?B?cDJaZnFwZzNZOU1nZ2plbmVCQlM2TFFlS2N3bUc3eVpQVGNZdXJHektCaEFi?=
 =?utf-8?B?VmxGQXk5ZlFrME4wY2t5NmQxNk5xWUJUY2dRWTlUdFpKcTJSZU5CdUlYR0Ev?=
 =?utf-8?B?ZlVqczNuN1IwQ3drVFEwa0s3aVBvWGR2eHBaeUs5R002YXBxNytIRWR3T3Uy?=
 =?utf-8?B?YnRhOHMzeWxqT0RrUlpSS3VZalAzV2s3NS8xSWVpMFlLS1JkOGhsbll0cTdi?=
 =?utf-8?B?WnlGRUlNMkVZbDZGVTk5SkU1b0VIZ1c2Ym9MZXVTSFR0U1daMmpPbGYwd2hk?=
 =?utf-8?B?SVlOeDBpYW0wbjJOSEhWMG9ZMG9PL01VSVZSSXhYV3M0ZkUvZHBDOEZZTFJO?=
 =?utf-8?B?T3kvUmRIYVV0dENUUUJzZzJ0TnlLRE1YbGRLalZjcnVJVVJ0eStaT2xTdHFm?=
 =?utf-8?B?bWw4dEQ4WGxzSkRxS3lQeHY3eTJiOHFlQ1IzVCs5dUZ2NGZqcVdsY2lHNlZ0?=
 =?utf-8?B?cXJrT0xPZjFrL1VHWjdUM1hHMEtEV2djSm55RDhzUG8yU0hqNGZ3OVRmWmto?=
 =?utf-8?B?c01pcVBRQjV1azA5UmhTcHdwWDlORVlueWFtdGtRcXRaRFlYRi95aGkvZGo5?=
 =?utf-8?B?eUlGRlY3aFdRWGJWdHBIWmliRVZnR0o2SFRqT09lUmFVSyszSHovdTl6RnZH?=
 =?utf-8?B?RVNObWd6U0tjODI1MWhWY1psazRBL2JOV1ZmNUU3Y3RXTTdqOUdRSHBDaVZP?=
 =?utf-8?B?OWZGVmwvSXErbnlDT0RqR3YzR0ljTlB0OE1qcDAxbHBsT2IzMHVWV3VhRFpO?=
 =?utf-8?B?VVdFK2FBQnZSaWVWSENnRVpBa2U3L08rWWVHWTUrOGxiZTg2NFp4ZGpIN29u?=
 =?utf-8?B?R0x2VUtzQkQrb0QrdGJNcmRDVG13MjZ2elZrQTM3czkxcGUxZUpFVGs3M0NO?=
 =?utf-8?B?VE5XRlk1VEJwcjBwc0FBMWFFMXFHZDJQRlJ3V0xOZ29SU3JwVEh3TllzTU9t?=
 =?utf-8?B?L0JKQUJrdkljTS9mWEpRdjNqN0w2QTF4dENpWlFMN29mOVlseXVWejcwNVJK?=
 =?utf-8?B?aEpGd1ErTDVLZWlDN3lYOHhnVGl1Slp5OE9FYmxCay9zWWswZGtBUGtCNXRu?=
 =?utf-8?B?cUt3alZUeHV1ak1OdnJkWUtLZFFpa1FUeVhHUW9nOVFnVytkNmcrK2pjTkk2?=
 =?utf-8?B?Rm9kZnlIUk1CRm0xc1pNYnJKTC9GYVdOdkhVdllTdlRZcnM4QndIQ044QVlX?=
 =?utf-8?B?MXhVM0tWTG1VeXArSEF1SUkzaGErZUxKWXBpdjMvVW1KRWJJTE9BeDhZK1Zm?=
 =?utf-8?B?MmZNQmxLRWs5YlpPRWljcm1FWkNIM0NYYkdJekZQVDJ4d1RaOU02QnI2Mmwz?=
 =?utf-8?B?YzNRUmJSQS9JYnAyaDhzNmNFNHV4bTd4dUZKYUgwMDI4bmVKV2Y4dFNFS1Vu?=
 =?utf-8?B?a3JGNXQ3NzFTVE9KNktRSzdncDIvN2J0R0FkK1FiRGxFVjhxN3k2bitEV3c5?=
 =?utf-8?B?eGE5VzNjbGxnczRDMktrbDRoeVBHcEpPT25XckQ1R09OQWdlVzd2SVk4T2dX?=
 =?utf-8?B?Q0Y0eFBINFZ1RUF4TVNzNDFTMzZ1Q3hqZ282SGcxaVlrcTkvZ3pELzFUbk5W?=
 =?utf-8?B?ZnU0VUpKT0R6TFNBR3laVk04M3E2bjMyWmJpZnh6RjBCNEorM250QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad00810-87ec-47df-83a1-08de52972dd1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:30:39.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnPtwUCca1pUJKQSXkB2vp04XO5bMwM3oTPBNaBzxV1iRrh/SpEmu7SziKKD9caqh37LqMuEVuQdOSRNyqby/eltylnO8VhPTvfsc4XOPj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:30:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8488

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/building.rst  | 40 +++++++---------------------------
>   documentation/ref-manual/fragments.rst |  2 ++
>   2 files changed, 10 insertions(+), 32 deletions(-)
> 
> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
> index 60ad11f52..c153eb9de 100644
> --- a/documentation/dev-manual/building.rst
> +++ b/documentation/dev-manual/building.rst
> @@ -51,32 +51,9 @@ The following figure and list overviews the build process:
>      Yocto Project*: See the ":doc:`/dev-manual/start`" section for options on how to get a
>      build host ready to use the Yocto Project.
>   
> -#. *Initialize the Build Environment:* Initialize the build environment
> -   by sourcing the build environment script (i.e.
> -   :ref:`structure-core-script`)::
> -
> -      $ source oe-init-build-env [build_dir]
> -
> -   When you use the initialization script, the OpenEmbedded build system
> -   uses ``build`` as the default :term:`Build Directory` in your current work
> -   directory. You can use a `build_dir` argument with the script to
> -   specify a different :term:`Build Directory`.
> -
> -   .. note::
> -
> -      A common practice is to use a different :term:`Build Directory` for
> -      different targets; for example, ``~/build/x86`` for a ``qemux86``
> -      target, and ``~/build/arm`` for a ``qemuarm`` target. In any
> -      event, it's typically cleaner to locate the :term:`Build Directory`
> -      somewhere outside of your source directory.
> -
> -#. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
> -   ``conf/local.conf`` configuration file, which is found in the
> -   :term:`Build Directory`, is set up how you want it. This file defines many
> -   aspects of the build environment including the target machine architecture
> -   through the :term:`MACHINE` variable, the packaging format used during
> -   the build (:term:`PACKAGE_CLASSES`), and a centralized tarball download
> -   directory through the :term:`DL_DIR` variable.
> +#. *Make Sure Your Configuration is Correct*: Use :ref:`bitbake-config-build <ref-bitbake-config-build-qf>` to
> +   define the :term:`MACHINE` or :term:`DISTRO`, and open your

Unrelated to this, but I'm very confused as to why we enforce a MACHINE 
when one is set with the fragments (which is the default). I don't think 
there's a reason for that and it makes it "painful" for me to build 
multiple machines within the same setup. Let me pass MACHINE= on the 
command line? We don't even tell users they can simply remove the 
machine fragment to then pass MACHINE from the CLI, which I believe ends 
up encouraging users to have completely separate setups when the only 
thing that changes is MACHINE.

In any case, this is unrelated, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

