Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE60C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:16:50 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.web10.20994.1750688209156737759
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dQtejpzm;
 spf=pass (domain: cherry.de, ip: 40.107.162.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywDYVDskqn6yvxFkMwF0gOiJu+RjUTlKmfCAVgfjyJ5e7UfMJMkhi512LL/+NVQI1ZV/J0LdBB7dhg+JhRkJDbMl9eYqfXYnwWyjCuCcx4dFrAxTtLQapBakLct6/K9aRst32IQHe9RhZMEcLypcmUHSMBxH0VPkBWaHTV11hJheuRddEXzTqVwgbE2wo5wBRN7vsaRxkRpa+1PM4je4ELkEM1CSfPEYM66/0dlQ2a3c007AgMWmvQnOs8dVwh6D63vlXL2J8Fqvn6umILEcXTav5GORXcGZLFR6sWHppr5WxoLnpj/WFY8Qm+4Xx4aRqalzVlDRsInAv8Xt1Wnp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Btedbo/7eWlA293WRE5QnipPsOJ1vM76FXIzfOzt/ws=;
 b=uKD4wGhV6CLNZWntAS/niKt3QWGikESpnFZj28vs3Qy1XlpRLu1pweuAWI/A+I/7QG16/jaMJ/LnDFuWGo/oyEY49qczOOgzMuy7928XtqCDR/Cz/VMwyDT5CqGKq1Z+jM1D7wzAqXrXYkNmX3Y1jlaNKHX72RSqKmB4/Egmh8ba5GOMovONgZJGNsppIwigkL28+S0o84z6xYOAWZW6Y11H1jDTaRGEBlG3Tdor5lFqNjDWXRsNpOcCWvaWPy0Pe/BiPJbh/uoJx7cgkb65P5G5pT/zA6pkTlpnwJ6m6DzX4EIKWJleUTL5U4ofAqpyffCcxIrvRS7dR9M1Kg5MpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Btedbo/7eWlA293WRE5QnipPsOJ1vM76FXIzfOzt/ws=;
 b=dQtejpzmxg0ZrLT9oRjfTv1b9vc3dyMrYAcET0OPlahnTLxUCn10vuiLIK4e0vq+f512VvopXl3g33og7WrDY/gv8dX2HHHaZk2kS41DCxU+02lB0x7dNhDmcWylQzvbawETdKpMbF1R7eXXM+uy6A1R00rQQe7y656PATUB2kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8512.eurprd04.prod.outlook.com (2603:10a6:102:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 14:16:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:16:45 +0000
Message-ID: <790f4b6e-7176-4b2e-abdc-d26243aa0db1@cherry.de>
Date: Mon, 23 Jun 2025 16:16:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR10CA0118.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::47) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 02731aa6-9f63-47b6-5324-08ddb26095c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bThqbDNxd3MweTE0eGVQZlRtQlYyTVN5L2k1Rm9PSHNmQnpqTTZrY3BJc1hr?=
 =?utf-8?B?Nm1WSEVLYjVqc2JaK3A5MCs1bzBCUERKYWdyczlOZXEwSVFZU0dIMjlzUUdq?=
 =?utf-8?B?Um8xSS9tcG5QVjFJdTUrVXY1YzJ1UGFTbVN5d3BybXNqVGlNeGFwQ2MyakxU?=
 =?utf-8?B?aHRsc3paY2tIbW9maWszU3VLblhjL29PYVZpWUhvSnJicFZWd3NnWXFJNzlu?=
 =?utf-8?B?cGV5QUdnMEdXcEdIUEc2UE1tc2MwMGI4ZjAvMG5uNE4zMFNMQlF2UitaWUp3?=
 =?utf-8?B?a2t6T3lOY0Jxc3c2MTIyTVk1M1FraGFiT0p5bVZEWUh1VnYvNXhSSkpPQjBq?=
 =?utf-8?B?QUczWU5jOG9ZMVNLYk5IK3cram5hMlBKNUxpZkthZ3NSZTBYcDd5VTZva09k?=
 =?utf-8?B?NFE0SlRyM0V1c2NUdjk4L1Q3d3liNEkzSDJJU0l1eXhKMGF5Nytia1l2cVBn?=
 =?utf-8?B?NHZwelVFR0VvNUU3bzJ5ZHFKZVFEZlBiSW8rYjUzK2ROQlRsbFAvTFl3KzlT?=
 =?utf-8?B?akFPSFFXY2k4Q0JIK0p0YnV5L0FIcjlVbnUrQVZ0YjdkWFJNL05yQ3FleGxS?=
 =?utf-8?B?SVoydjNKWG1xbWQvWUQ2VFlIL0ZVMUJuQVdiZ0F0NUxKbzhMUUVqcjVVYkZO?=
 =?utf-8?B?Y3V1cVBCMXQ2ZUE4ZXpwL2ZyYXdtWnRkaWEyNFFtZmd0NG9BaGtxZlhsVjJa?=
 =?utf-8?B?ZzMxamF2ekNjRk1Ja01leThDaVpMV2IxV0dCQnhMSTVZNEJGUzJIaVQwbm5K?=
 =?utf-8?B?endabzhOK2RVUGUwVHR0dmNmdE9vWXY1NlVHTTdoMGVWTUJYZE1oTGErS0cw?=
 =?utf-8?B?OElzWTBxNzNRY0lFcElDcEQ5eExsYlNnWmxqVVplZzZqNmRpeHZpSHJsdzFK?=
 =?utf-8?B?SU03eTI1d2JadytDbHlsMFlCVHEvUXFZRit3REtIdUxzMHpZVXZUZUVIWXUr?=
 =?utf-8?B?Zkg5N2lBYjFtajA3c2FzQlVsYUJlTENVMGJwdFllUVpPVVV0NEg3M0V3UFRi?=
 =?utf-8?B?MTdMaWFwck5lRjZyRTh3MEdDN1lza3MvTXh1b1U5aHgzS3BpZE5LZmNKeVFE?=
 =?utf-8?B?OEpFY0xEeVJtMVV2NFp5RjZldUJ2MGxsM1d1YXJnMUdJaU5INkoxK2VHK2Fr?=
 =?utf-8?B?Q25uR2Z0aURzcTBYRjRlbGZHMmdKdlprM2VoWDFOdENNcWdYRkJvUzNybFBD?=
 =?utf-8?B?QVNLUHVLd2E2VFhtUXdUREJvRGlxY3ZrSHRvMVJrRHVBNndtN1BJSjV1LzNK?=
 =?utf-8?B?VlZrU0k1SkVMTkJSQmZaWVhHcVpuaHA4UGZRQjRYSkZaWkFTQTBJM2VPanQz?=
 =?utf-8?B?VlFjUWZSeDRwNkU0WkJwdFM4TUVlSjJWcWkzbExEMnV3VG93MWxGaEV1cURG?=
 =?utf-8?B?d2wxMEUzaDNnbmFBK0lmNUczS2lidDBKcEF5VFdOZ21WMGIwcU5COFlydXEv?=
 =?utf-8?B?OGcyaVcyT1RWZUZWenBMeDVPVTBhNkI2UHhLZUlteVJkbmo3azF5Qkd4clhh?=
 =?utf-8?B?eUE3RE16elVmcVNGVElyZTVLdUo3TUZKQ25kelFteEVDbWRmK2owbGVNdTdy?=
 =?utf-8?B?RGdJbUFCR3gzeEFMMXJPTXJFaENjN3dBdVFQa2REM1ZWcmpYbEFYK0dIZnJu?=
 =?utf-8?B?UnJ1VmJPQm9OWVk0OFpISVFKYThod0RlODRNeVRiTzBsbnBtU3NsNjZFVmlT?=
 =?utf-8?B?OFFhVXlYZFo5Tmp4RjJmTmVhaDB1TU1kSENoV05TS3krR0w4Vjk0bnVxZEt5?=
 =?utf-8?B?Z0dwU3hweldTMkNzVlFQaGtxc0xsNGVOZ1FnQVljWFRhakRVS1h5d250WmFZ?=
 =?utf-8?Q?2MyOqEjCRxehBqsCf16VUiC+uArge8XYV7LbU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkpWY3NlbTlyU1ZtTFhsTzg4WDY2MG55VFRCZnJabTA1dGlkaTdpTnJRTDJx?=
 =?utf-8?B?Wk5wanpaeWNrMjF4YXYxd2ljTUI1RTViVmhnSWltdXRHMzBDNmZ3bmd3R010?=
 =?utf-8?B?UnIxZ1FPWWd2L1dLMVlEQnFOcGU2aGhTckJVS1NZMUdWRVQ3K0laOXBEYTd2?=
 =?utf-8?B?TUZpZ0dPeVUweGxHeHB5RDJQeTBhcm5odDhudURYelNNRU8wTVByR2QveWhk?=
 =?utf-8?B?WVk1dkpjS2RyZWhBdk1MeTJid1QyTmZHLzhrU3VWS1BGY0RFZVVkYWQzQ2VU?=
 =?utf-8?B?V0pJU1NVY3g4LzBNZFJGeW52K0pUOWhVaUNDUTdiL3R3Nys4dCtSeUxXR1l4?=
 =?utf-8?B?WEE3dFFzUVdOTFRqQzNiUzZrVnY3dTlPbEVRQlNxU0FLNmNrSHIzNDMzelR4?=
 =?utf-8?B?SjNES0tsVStzQkJDS0Y0cUwvZjlmZ24zcVpCZGRoamJyTkRia05TV1lqY2hE?=
 =?utf-8?B?STlZOG8zSy9Yb1BIaXBJOFllVUpMTDdqRU1lSjdxcFJGclRFMy9Eb0hoVjF1?=
 =?utf-8?B?ZHZOVElLLzNJeXZpN2hOMzdXMjM1UUxKc0dDNmE5eXNYMDB5aUI5YzluQzRv?=
 =?utf-8?B?SnBmTTh2REx1M213eVRjdTRDQjVHaGhlbUlSSVBPM1BjOXNIcGljZ1ZVRTQ1?=
 =?utf-8?B?ZUtMQmlUanBpSTN5bnpFY0hVd29sRTVOYWN3SEZuejJOeGtGVk5hR1pxZ0h3?=
 =?utf-8?B?THRDb2NpQlVVbVBCajQyWjBETHlWc0JjZ0xOTHFYbXpWU3FqdkNBamlBZlky?=
 =?utf-8?B?cmZyQ1FhTVJyYkt2cTdBRHZoazg5ZVRRT005MExjZE02SEUwUzJGK0owbS9t?=
 =?utf-8?B?RDU0dGFwRnQzUW12VUovdldhVGRTMk91OEU1SEQ4S3plWG13dWlBYWFkOS9x?=
 =?utf-8?B?YlV2WXZONWRIVGNVcjFZSEZhZU1ZeEZFWk8zcEk5QmdrWVpCcGZNWHJlS05j?=
 =?utf-8?B?aDNhOUV0aE5xRnRTZDhndW9aVy84cjQ5bk5WR0c0blgySFhkQkJvZXpFb1pC?=
 =?utf-8?B?T01uWVAvMUt2L2FidXZMazdjVGZLdHRrb3FNWGlSd2JZdVFkY2lORjUrNDRQ?=
 =?utf-8?B?R1NxcGliQUNpNWFielJFaVF1MEx5NEhlVDNaYnhrT0tCQ2xnaUdLTEo3bjFI?=
 =?utf-8?B?TkVpMEVHQUxOSEdiaEx5bEdDTHdwd3BQY3NaRG0zdzFBNlBTRThYVk5OcHll?=
 =?utf-8?B?dWtBeFM4ekN3eEV4VFpkNUc5K2MwTWZkOFFuZUdwSDZQOFZhc1p1T01JVVNw?=
 =?utf-8?B?UDlOMTRBeWwzVEE2emlvS3NvZHFZKzdBUGNLMzd5S3dwS1BvWFhVZ1RCZWF0?=
 =?utf-8?B?bzdxbEJ3NG9YMnpzaFJHQkVBb3pPSXczc0RROWFoN2NUK3lMa05IejQrdWNJ?=
 =?utf-8?B?OUFwRGx5cm1qdzh5VjR5cGJmSGxQVHRiM2l5VXN3MDFOM1E2aml1bUxaRDRN?=
 =?utf-8?B?T3puQmRFbUN6eU92VEsrbnl2QTYydlI2ZUs0bXlpYm5hckdmNmljZmF5d2F4?=
 =?utf-8?B?MEtJWDdTd24zcjFHRnhxK3dCU2tUeHljZ0I2NUc4V2JDVVBBMHZpYTMreVZ5?=
 =?utf-8?B?SitUQkZ5bUExenhPRm1FYk9PZVUyaU0vTGFMQW1EQ2dpTW9vNFhGQ25tZ25K?=
 =?utf-8?B?d0paYXZ0ZEJSdWNSc2FqL3pKdlRTa0R3dmJ4ZFNvS1BCYjhVSlZjdG1LeS9t?=
 =?utf-8?B?bzk1dHBwK05ubmdScmNWSDdRSlhNWUFGQjZRblUwdzdGTXVERkdXUGlzUklW?=
 =?utf-8?B?MjlSMjBDczhyN1ZiL1FGa0JxNGxjdnpCMThYeHk4QUZHRFNjNTc4RjdYd0tx?=
 =?utf-8?B?UUVWRlNPNkZuNzFsT3V5dXQ4UGlhRGI4UUlsdTdSVWNlTUxNRCtTQnhtZUlW?=
 =?utf-8?B?YkJFanNHT09ydEowaEJlZ2ZNdjNWVDVxNUhvNDdMTDU0RytLam9XZGZiRFow?=
 =?utf-8?B?ZjlqWkIyUlkzenFkYjQvaHNlNFNGTjNPeUx6ZGFMdWJjaUNNYWJYU2Y5ZCtK?=
 =?utf-8?B?WFpzNk4zU0Z4ZFB6KzZEWFA1enh0SGJvZ2NOY0poT0J0eUhZSnJXVnJ1QTZW?=
 =?utf-8?B?SGhqbjdleXRZTXJaWkExbXFBL3AzdXNVMG9jVHFyTUY3ODVKdTFOUm5WZkpj?=
 =?utf-8?B?UVRpY3BWaCtncXk2UW9YaGFEeXNhSitFYXdZVFhHYXJtbE9MTUxiNmdCc05E?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 02731aa6-9f63-47b6-5324-08ddb26095c7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:16:45.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkpWvBN6jb2x7lMV20BkMn5qT2MivN3OGbQAiwUNq3Rv2GzJh6kEFVUl1VxlgkmMIeKV9hq8K1Ok6l0PHsBOYqjh1jzs09MPrj/dvpVAjso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8512
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:16:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7158

Hi Robert,

On 6/22/25 12:59 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    * Add note about new URL for FHS 3.0.
>    * Add wildcard for "INHIBIT_" variable.
>    * Fix font for ${PN}.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
> index a05f39ca1..077184657 100644
> --- a/documentation/dev-manual/prebuilt-libraries.rst
> +++ b/documentation/dev-manual/prebuilt-libraries.rst
> @@ -22,6 +22,13 @@ To summarize, a versioned library must meet two conditions:
>   This section shows how to deal with both versioned and unversioned
>   pre-built libraries.
> 
> +.. note::
> +
> +   In the shared library article referenced above, the link to the current
> +   version of the Filesystem Hierarchy Standard (FHS) is out of date;
> +   the current FHS 3.0 release can be found
> +   `here <https://refspecs.linuxfoundation.org/FHS_3.0/index.html>`__.
> +

Considering FHS 2.3 was released Jan 2004 and FHS 3.0 on Jun 2015, will 
we have another FHS version end of 2026?

We can simply link to https://refspecs.linuxfoundation.org/fhs.shtml so 
we hopefully aren't outdated ourselves later on as well?

Looks good to me otherwise!
Thanks!
Quentin

