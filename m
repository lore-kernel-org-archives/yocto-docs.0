Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D202C5AC81
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:42:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18853.1786020133943842754
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 05:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KAYFQxV0;
 spf=pass (domain: cherry.de, ip: 52.101.66.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+Ip+G48Jf6A66k6kwSo7LqaEeK5jMcW3kAmhWPi7W48TRYo9ag2feIVwSfIT4+RStzQjo3CwYqygfiPFcj53xBtmZYD2ppip8vQG0FJWQYTCeiIbTCOdt737CtWKibhD35NOvgFRz5YEJ5OiFkjRvH2lOBK/KHlro1RXrcFFDn8k2sXXkxjec1HwBoKGauvpL94uvEcRvqv2xXWiV+8Q36NlDgGShOKKq+CgrrSjrhMgcyFYc5tm8HqHSpMlWuYM/KMTdv5fQS2BYhKGXysoJrZ72Bw0SlnogmclH6Z1PQko84JLSSSCzxGhPjE3fitv1aRFanfVMdxfeBwogZqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2xXH/GqH8kOZuL+K9O96ZbS6BAxgYwGZTUZbQleR/o=;
 b=pAyVheMxytCNCD4/CX+p5uSxSbfRgW2IEIdGGSaAg9vUoSmMyfj/e/SlgiiVCvOzUWj2XQ7EcpudSaqCiP/iE9br9ii+CaZkggxMjhb0GLwND2dWrgIGMa7Y0qkzW4CrRF0TSHY8eed7e+hbl27Ce/nv0tKdsyLSOQgYJ9aqt7EOaOzxDwHb0ZMu72/1t7S/dxtQVWrZhhascardVplrIfA3LGdfer7kG8FURaE3ZVxYd4uFWpOugZQ42v3BcxF2ocTRYg/79SFwzV5xEHpW2X3NzviFCmXD3he2Mhq09/bZtuAO/CQB2TlfZnmeBzQMpJfVuKWnkqbPxBQozCQZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2xXH/GqH8kOZuL+K9O96ZbS6BAxgYwGZTUZbQleR/o=;
 b=KAYFQxV03hKA2npVgqXB73IIeZ/MXLKS29BYCH2a1T8kcO6hY8qqSIC6mcxxfDc2t79vA4t517ETbgM71fGrWYecSHpgrWzzAHrlGiFfvtlgYbOOqTJrouyZ8Y/rigXEooVrW0bvfGUJCLevnOwqy5bG6snK3IeG6WvHIq0XR6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 by FRRPR04MB12571.eurprd04.prod.outlook.com (2603:10a6:d10:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:42:11 +0000
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5]) by AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5%3]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 12:42:11 +0000
Message-ID: <d9e8fe7b-349c-43a1-8ff4-188fe4c1f417@cherry.de>
Date: Thu, 6 Aug 2026 10:45:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 4/5] sdk-manual: rename the section to remove
 "extensible"
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
 <20260731-sdk-clarifications-v2-4-b34f797492b1@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260731-sdk-clarifications-v2-4-b34f797492b1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::18) To AS8PR04MB7733.eurprd04.prod.outlook.com
 (2603:10a6:20b:288::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB7733:EE_|FRRPR04MB12571:EE_
X-MS-Office365-Filtering-Correlation-Id: 1796f8d8-e93e-4dfc-0089-08def3b8229d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|366016|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JzasGUU+9BsB5UYxtCkS18r9JOX/08icQIwYAAyYCMMfpmaGxgTB5byshPUqdDL6Twq13eEox2TrX1UJ/08Rj/RrV1w2Tw1A/tRG9VxXJ+FMT4mGsAMgbDQi6bpKbvbhVZ4Qvfl+45srXeDR7Lpt1hZ7TQaVgtoYyuGzNChLAg/9f9NysKiUmSRGviULh3QvyPIF19Y64gz4uzSfX9lgDg/cTRBpL5xxG+lxJvBl/UbePRLErgfboGIQSzsscEmhGzxkZ9IuUXYDiCrWdtPYgeVCZBmMILLrk1TQRtTN+k0jkWLT4TUGf87Nq2PgZ6wV35rHhb06iMvtga93/ZOt1IDfx8CtABgn5uZUrJYUJfUHpK/1DIichREKBIyy43f+OumhU0BD7501z4AqPfVV98Ur33GaNc0kSpThiLYjHSpvV1ADGb3tT8sMFQupjrZ5IOUBkiG7IUOQIgIRioEEB1ucT9XLYTelaSukGtqfHCoifxD+6JO/kxrPJNWs2bMECLSnvCgCwctu4Ah6pnztDu2hHgNLu70LOQNgNQZYbUDRjYQ2+vp8aWsyoLjx8dVEDU6D7WKaH+p+6Ds+ShFle0ENY8sEFTLwBtALtRG2MgB6XPRKEgaMO8Nc5b5gnMXmkL1rUla/Sx0BDIw5zzCkg1IIcBMH0R2JVEqeHQ/lrUk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7733.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ME5IN0J2Ump1MFBTRHZEUWhRVlZXbEJYbUtwNldoWjFoVmdWQ0xra1o5RnNN?=
 =?utf-8?B?YlR4U3A0cmNOdWNybVdzWmhaenVmN0QwZTVlV2NVSCtwZWVKMktNRDdPOW54?=
 =?utf-8?B?Z1BoRXBQRUZGb3FBNzBwcmQ2dGQ0MU5idXpSKytMaUs4cGtlR04rY0xuNndZ?=
 =?utf-8?B?RU92ODN2NitDd0o0VVcwaC9NN2NDSjFTdGJLd3NNd2ljTjUwVXJDSWZjY2ZG?=
 =?utf-8?B?bitRMVNmVk1ncWprclUyMHRYMHRDSFpyRWdma0JlV20vdEZiSERQSEhkWUhV?=
 =?utf-8?B?YXZTNFg3SUFMakk5TVNzaVZMbnpKNDkvaVZtT2UwU3Q4OWJ6OHE2YWZ0dVdL?=
 =?utf-8?B?bW03U1U0ZmVMd1hmUVRoMGxwYTBsT2FGQUVYMUZGaDZjazBlcUZqSG5qN2NN?=
 =?utf-8?B?UkJRMWtmMnFwYW1RM2hlaFFod3JQZ1RUaG5XbUxOLzBSeDF4Z0ZseXhqbG5L?=
 =?utf-8?B?K2tzb2tkenhwUXltSVd2VzhsZjFUQ1pkcnR5WlcrMU5LdDVrTTh1OGdxcFp6?=
 =?utf-8?B?TldSd056SDhETTRkeTZJL1IwT2dmV2FzNm16QlJMRDF0dTN2NXBzeEQrejQ1?=
 =?utf-8?B?T05UbzRDUlNoZnVjY1NNNHkxdndEQUxxTVRoU2NoWUo3QnNFM2lvbXkxU1JO?=
 =?utf-8?B?TTNnU1RWdkhnWWNnbGc4cnFLbThMSUxXNzJPVlN4ai9GR05aa2c4V3J6RXJX?=
 =?utf-8?B?SWthcG9Fd0k5NFJVUjE3S0dyQkpsR2hTWkZCdmpLVU9CM09rdktuamNmUUJH?=
 =?utf-8?B?Z2RUQStJNFVpb3QzQ2RHSnZmK0lrMVk5ZXZMRkZoQVhtRXRTTlo5bzVTekox?=
 =?utf-8?B?em1YclhRS1NqV0k4aE5aRDJRQmJBZG9pSjdkMENVd25hbVEyTEwwcC9vTlY3?=
 =?utf-8?B?eDQ2dGNnZ3lUSG12VG1HTVNCa0M1WXU2ZHpERmlmZFhRYUV6eWIvL2k5a1dH?=
 =?utf-8?B?emx1Sk5zSVU1djYyN2k0TkNIcDNRanpJbDFRVkFnQmVJQ0l2ZFhjZW9vaGk1?=
 =?utf-8?B?SFB2cVZNajhiWURBRURjQ3hsNUJUeGhKNmxjTGlqbm85WUVYNW8wRmpiMEly?=
 =?utf-8?B?ZXNUYUZqSnRTZVVxaThjbnBTMzdFVS8zZk5jYnd6UE9zdXVkQlZLUGs0MzFm?=
 =?utf-8?B?WXBuRDNrN1k4em1HSjlRM3RSRmdGSzM5Tk1RZUlPVDEzTTNCb2FMaE5nejJv?=
 =?utf-8?B?aEJKRFBOL1ZFWmV5WVg1SUM0c2JKWjVkeG9EcXVDdkpFTFI0c1hZd0p2cjBT?=
 =?utf-8?B?QnlHSlp0Ty9SR3RGVGdxSytKeXA2Z2FuMExMcnlpd3VEU1QrLzF0aWhPOXpx?=
 =?utf-8?B?azM1R2htRTEwc1g4QUxjUE5pV012UmZ2MUduM08xRVZuNzRKQlBWZDdWcFRa?=
 =?utf-8?B?ZDBJUG9TUzltdm1ZWWI5bmY3VzJKdWlwZkR3UGFUNHB1eTJ3YVl4NDNXNmlm?=
 =?utf-8?B?SGduc1VMSUZaakkxd3JsWkNhRGZTNkZoNzJFRyt3MWJyWVN2c3lWNGhkbTBB?=
 =?utf-8?B?SjQ5RjdHUnBQVk03WFFENWhFNnZBV2RONGtQcFRvMTVmVlUveGFkV1BFSEhG?=
 =?utf-8?B?MlY5ak1KWk5RcW01YmtiSHkxa05GU3JBMWlqSGhFdGMvN1gwcVl3azlSeFQ1?=
 =?utf-8?B?YU5Ec1g0aGcyS1RnRFgzbG4xbDRXZ0h5YU9USlc4VEFCT0pVVjRTalBxS0No?=
 =?utf-8?B?NVR6TkxZSW1iV0dwYUFLWkZDWUFTS2JOTW1Pdmk3eEVyYy9lVjMwdUNnTTRB?=
 =?utf-8?B?RVYzeTJpdW1KZHBucDVON3pVN0lkM2o2bUxZM1VkbVJrNGkxL1k1NEg5amM2?=
 =?utf-8?B?N0p6N1JlaURzeU5iRE96REV5VHdDTFB4SGxoNVpqbDZXcSt6a1pBZS9TbGVv?=
 =?utf-8?B?TWptTi84TUR4ZTlUcFdvQS9XeDhrSXVMNS96dnpPNktiSllFVENJaWxWN1p5?=
 =?utf-8?B?dUdnZWVKRU9pdWhtb0FCQWczS0V5amp0R0pHd3JWYUoyazlUalFXMGRWcTBh?=
 =?utf-8?B?TXBRYU84bUxhTUQ5cW55NFJ1UVQ3bExGQ0NPbEpzY29NM3liWTRzSTRlMzlR?=
 =?utf-8?B?U2lZTGs1ZW5wRm5MM05saTJRMCtURGVTNDBiN1lzejJCUzBDenRaRGQzTWth?=
 =?utf-8?B?QktVd0E4b01nZUVQR0psdUJDa3NFbHB1RGhSYzFsaU9jQVdTS0RkOUo2Kzdu?=
 =?utf-8?B?V2ZMSUNKVEtrSG9GNVk5Z0lXQzZoTlNLU3VtQTNsamp0d3J2TldMM3NMdEVp?=
 =?utf-8?B?RkVxdVZUZG95RE5PY1RzcnlRMkR1TE9pQ1lzN3hHdVpkR3FoN0o3UHpJbEJu?=
 =?utf-8?B?WkhITmZzTFBYTGZRaGVneFNRQWsrNDFVY2trU0R5UjlxTXdnaS9jS2pvcDhR?=
 =?utf-8?Q?U6bShmtzULX4lOFJ3xpGjrL8WirVHCvQmyN+NebOflpLu?=
X-MS-Exchange-AntiSpam-MessageData-1: QbKNC50RdGAz8H8WBFMW6jUAYgpElpXyKEA=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1796f8d8-e93e-4dfc-0089-08def3b8229d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:42:11.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEZcG7AKby+vTR1akbYHqHMzS6eD4Ax3ifeeD78m422IYVYCMSslRN8Ztqy/HGnHCGct6T74bPtNxBz2GnVRdgGfCLrWq80vhLoeqbsw29Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12571
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Aug 2026 12:42:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10239

Hi Antonin,

On 7/31/26 11:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The SDK manual covers both the standard and extensible SDKs yet the
> title does not imply that, so rename the section to "Yocto Project
> Application Development and the Software Development Kit (SDK) Manual".
> 
> As a consequence, rename the first section title and reword the intro.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

