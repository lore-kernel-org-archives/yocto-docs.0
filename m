Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9468BCD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:49:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45797.1781884181245414110
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HBMCnOP/;
 spf=pass (domain: cherry.de, ip: 40.107.130.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSBD+NeT48vn9JK/no06dgErs283tuFLQjHTYkILm9dhC2LDCM0EQ4HIWoyaQZ7K8XJRjvBvKoFxnpl5hDZHYJTnR6DF+n6ROBnpJqGPPLqnJG0NUXoejlixaIcsXeZNFwoqNeOA9+PJpLMSmAu4/Vw90XakqZn8jmQLvM+Pp3eb4wAP2MEzgIurgxQbtq5sCNdHJLDAGxTfQZ6OWARs1CnNVBuXvdmJoolfw4F5bEG+Tq9Mc4h0om5m8MES4rnM0pdEhQNXMsebGRgcHF+gvajzyDzI+nDHuJm5G5vCB2JLH7d6JgobhtzSyd8wsXJ0mrCDo0A+e9Os4O1f0poH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YGLRc/xJHfr/bwE5E/60kuszc2Ki6zMjaNyVF74OdE=;
 b=SlSPfbWTHnfSX9719jug+9I4XT+0AlVHqnCPsMsUraGN0Dr9caj8JKhGC/2dh0vrJUgxmt23vqUQbKGxNrsELXGHUvqrJAQb3Q10y//2YeR2z19RDDhE4kvXP7YvQraZpXc/vjyI7q4U02W42M0QLSlb8E+CitAYRat6oa2HPD6FLunPKK4Qhi8jKiFIjT1nLSvDdHMxhY29SQOf8dnXRqw4T7WUEGohQEMoJeODO9icFDg629015ls+cJZ+GCU+MmMmmep4Sef5wO4NRNAOzIrpOJYuu27oeKiEfo7aTgI7nBF08xXUva6ZEVAThB1tVTUpLoE5G7oxmbUYMPiQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YGLRc/xJHfr/bwE5E/60kuszc2Ki6zMjaNyVF74OdE=;
 b=HBMCnOP/DNgYsMoGD8jb9QZKeyuPt+lL7KLHzPTVJbmwCfVUv7JiW0Ju8UnioMr2J1Xzxdqb0RNUZRvtkxl/1wMX73qXTWMo77sy5OLB5HZwc2+M5qL/n8MVNErUMuh4Gt1o5Gzab+PREzImDgnnxqZh/Rm4Ng01UHmvOng9P2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DB9PR04MB8361.eurprd04.prod.outlook.com (2603:10a6:10:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:49:36 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:49:36 +0000
Message-ID: <eb993591-b3d4-4292-8409-7c7db83841a0@cherry.de>
Date: Fri, 19 Jun 2026 17:49:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0081.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:349::9) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DB9PR04MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 19905865-b999-4e69-29c6-08dece1a5d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ZxSSWpX3zEXV6YoPdfZt/jviEHCSoqOIajtmOxy6a1V4r2zqpMTFIGiWHTJ1Cjspd1Y7Q99x+cmLpNFDcU8oXRRXHwtewDN+jvW+/T7T89iuV12DWZFLQ9fOboncS+lPXUH5hhOlp9pPKtcEbt9Jj0K14Cp/ufpQ6m082L5jwqvXkGTRQv7yVyLkzMatqhYTu9eCMVL+BS4idtfErm8kmLVIXbOHEmitpkEZJAPD95Db6LxOLTLpK3ha3aI30AaODWxdumupW39GXyP3/jF1sOI5AHqr2uQp7JFe3cabK+QBXjLMqLtwE93M/oxRfP2LVZhu+twd+76BG0t1ZMD5ihmjLnVvLmlGF2DIh8E8UhFDgspJDfOu5smkLjWtZQQaahXD/zovRC90kA5dwy3qf9jkk4gFypTnZFQxnJQQ9+qYxBo7ezfwlZANqyKooCD0FaYFYQ5B+/RpyUgvuQYarse7IwYfQABzz8nAVC40vjaX9bNzACgOypFm17OhMSgZns2xOqAQMe0CI80MXMnQBW4Bc5EnWkIU2WLYanmqPUGbZ2Srlaxtm1kl9yK5VhqNnhmUfdDYNUHeFBDZLhrc9TTd4L/7+WiHKaF8GVSYsyIzLQxnzMKTog1359uSDuBy+A2o+OlGztSzM9UHc8+Bj6VBev10hMvfFL5HiZR7S2I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEcrZGFlUzZnN2FwYk5wOHdFWXZIY1R0dmFzMEE0bWtkN1NFeFlCT1ZaUTNN?=
 =?utf-8?B?NndDNjg5WFQzdFhOQlFFN0VOdXJLUFRXdUhLYitRM1M2UXVTUFZqU0V0bkZL?=
 =?utf-8?B?TGpDc2RpUlhGSndJZ0NWR3hyempNcWE1TGVpWm5qZUJvUnEyR3BuaEhhc3ln?=
 =?utf-8?B?bjBxRWRnWGpYSGwrdER3bHU1Y2VNZ05WalR5TDRmdlFncU5LVHhPYkx4TS9M?=
 =?utf-8?B?ak10TzZYZTkxeGcwVFFhd3ZKcU1OenAvZ2FWTlQwTjk3UnZRWTJVSkJJeHZX?=
 =?utf-8?B?VjloWjBYUWNyaFdzeExsOTJPRTlDZUZVNzlFdUs4elprY3FJbTltM1NqVTBp?=
 =?utf-8?B?TWltS2JnNkhvOWhSNUU3V01GcUhlZUJ1VWR0aW04Q1J1NjNVNlBVUGQwWWZj?=
 =?utf-8?B?ejczMVhSMWl6Q0FvZ0tkQVVaQ1RmV0xncHl4d21seGV5S1BHM2JPbWZwbSta?=
 =?utf-8?B?TVlRWXR4NE12dmE1cldaa3h0cFE4cndwaUJvZnNZdnV5YjRXZS8vcDd6KzdV?=
 =?utf-8?B?MzNidDhycEVFZVhzSFkxKzZNSklPd2UwU0NjZkRyU2hSSWJ6RkR3ODNJa3RM?=
 =?utf-8?B?WlA2Vm1rN2NRMnNyS1NvOHlHdnlzanJXbVNObXRoL3pQSGFoVHhOdW50Y0Qy?=
 =?utf-8?B?Y3drVE82MEdtL1RHSUk3LzZTUlNzd0diMk1JT3labGFtTmpBMlI0Y1Q4RDIr?=
 =?utf-8?B?U3NCWlByaGJoSFFpUWgwbUdoRWwwMjE1WGg0SDQrYTJwdUcycmR3d2Zsdi9S?=
 =?utf-8?B?SlcwNmF0OVRNOFBVNXFNK0xXTzlXRkh5dkxLUm5yUHBHNmVJMUU4dnYxaXMv?=
 =?utf-8?B?K3lSMCtQSndMRDBkbTVPU3VMcUE1d28wQURJTkc4SXY0OUtuSkFGMFVYZnRY?=
 =?utf-8?B?bXpOdDgxREQvL2tjYUs1djgwdTlOV0tCMzRuaVJ6NnhSVDB4TlpzZ3NsMWRP?=
 =?utf-8?B?d3V4M2VjMFRMWm4wUllsaEd0R1dtSnpPVGJlMW5ITVhOTmthZnpYWE0vbTNW?=
 =?utf-8?B?T21JU0p5S3lpSDdjRk9ZdytaV2w2TU1ZYTJXcEY5YjFEVHVrbFg5Z2l0Qi9l?=
 =?utf-8?B?azlIOWNNa3o1ZDRnY2oxaDk2WFNPZzBZaFdidUlMUjRiQjREc3ExZEJ4bGVl?=
 =?utf-8?B?UElKRGhtV1kvcXJoMjdtdmNUV3ZjaVZFQXpXOXJMaXI0NldxMG16aFJDSnFV?=
 =?utf-8?B?Mkt6VHBJZzNpUHo0Vk1paXRzT0N0cjgrMk9Qa29ocWF2MTV2QUo5MXBiS2VD?=
 =?utf-8?B?a1Z6Uzl2eE5LVm1kTGloUkNZazU2WDV3TVhheStZenIzb2dqRWNPZk5reUsw?=
 =?utf-8?B?cFZnYjgyYnV3WmE2R01zWElMZjFFWG5nMzhtejcxT0VZeVN6S1JjMDk1dVY2?=
 =?utf-8?B?dzVzVGN3RVhnampISHpxWWZMdkFIbzE2MGZqbVRqMGg5TURSelZpTU9weEpn?=
 =?utf-8?B?d2VPWlFscVdYM01UdGtBSW01TTYvLzZtQXdPNFFQeTNxaVpTd1NhV0VFVTNY?=
 =?utf-8?B?U1RHYmlIa2NhdU9IMThWZ0FaSDF3djA2aXJ2bURrVHFlOXdpY0RMV0JQdFFC?=
 =?utf-8?B?ZmVSdUxWM2F2WjN0RUNBN2k2TEdSbWxmLzU0R1kxYUhWS0VxQnQvMmoxK1VL?=
 =?utf-8?B?WnBFTUx3VHFtaWZ5ekFmRlQxZkIvVXNySklyVUtYOWllZXZSSjhsenRjZFFl?=
 =?utf-8?B?WDJ1RFk2eEkwTWk2cVo1UllwdzROSkYzNVpxZWZTa09IUmpPSk1wZDVDY3pG?=
 =?utf-8?B?QWhwKzBLWlJWYitCZ252ZGcyUEZONWtDZzJXUlBaVjlud1k4MWVzQ0hoRmdq?=
 =?utf-8?B?cEdzWHdsZzFlZWwvZXE1cXcrQ052bHRkcGh1SlM2ZlJaOXQ2M2ZhVXYxN21a?=
 =?utf-8?B?WGk5dmZUNStPL3JSemtWYUZLKzdOeGJTWkRHY2FCY1c1RGRFYWpmNFRONEcz?=
 =?utf-8?B?OGRsMkpPZDNNTHo3VWlLbFVQS3E1a2c3NXhkQkUrVUNjYnpLajN1R1BmL2dG?=
 =?utf-8?B?U1UxZ0t6d1hJVTV2b0Jqc3k1ckswelp4MDhzS2ZmcEE0c0tDU3RiOEdaK2s3?=
 =?utf-8?B?Z3kvQ29IUkhxSG9XQ29pUVpJVDUwc3kvTEFabTFSYldraThOVFQzK3drZ2d3?=
 =?utf-8?B?RmV3SzRjNkJaMWY5MXFnQ0VHNVNZcWdNRWNtYkxiR1FuUEk2b3hHMGhqQmlV?=
 =?utf-8?B?a0lQdUQxYzlGdlFZWUpQcHJXYVpZQlF2eWhoclZlWEwwMjF0Njg4Y2JoaEpN?=
 =?utf-8?B?SENQaHllR05mYmh2ZzZYL2gzVnh2WDBTVjVZbFZRMTkwTGV4bEtROW5BK0sw?=
 =?utf-8?B?clI0VUw4b1crSktBbjZteXBPbGRqSVhxa1VPSmd3cGVLdmRSVnNNUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 19905865-b999-4e69-29c6-08dece1a5d21
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:49:36.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppWV4OLf0EdBUe6v5ZXfhvojKCMOKZA7FKvIa62owTfUvjCP8iaKjlQ54u0CizH/B1sSJ4i+ZDaS+ZZaDZ5hz0VtzmdeWmJ8NkQWFr8csF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8361
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9804

Hi Robert,

On 6/16/26 6:46 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Warn the developer that if they need to set "PACKAGE_ARCH" in a
> custom packagegroup file, that setting must precede the "inherit
> packagegroup" line in the packagegroup recipe file.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 95e07f85a..839a89d4b 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2130,6 +2130,18 @@ section in the Yocto Project Development Tasks Manual.
> 
>   Previously, this class was called the ``task`` class.
> 
> +.. note::
> +
> +   If you're defining a packagegroup and need to set::
> +
> +      PACKAGE_ARCH = ${MACHINE_ARCH}
> +

OK so reading this I was like "but who would need to do this? 
packagegroups are only supposed to include other packages and not 
compile anything!

Then I looked in OE-Core, and there are as many packagegroups with 
PACKAGE_ARCH set than without. It seems that the need comes from using 
MACHINE_FEATURES or other knobs that depend on some configuration variable.

I think it'd be nice to document this (if not already, but since you're 
scouring the docs now maybe you'd come across something like that?).

I'm thinking this is a big enough footgun that we may want to document 
the order in the variable glossary as well.

Cheers,
Quentin

