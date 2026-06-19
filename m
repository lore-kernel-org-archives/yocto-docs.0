Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BA8CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:54:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45918.1781884452153995908
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GlajNOik;
 spf=pass (domain: cherry.de, ip: 52.101.72.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Omh6kgk8cooGyYfwjvyAJsLI8MwmJrBDNgrPLT1Wt7h4kEIUislF/vnnqHbhMTTOQyGmqQ2pLq33d5MaBcrJIcNX6ND7WCiXAlk12SzmWXC2G42ubgzjIWUiihpPq+woManCWBhyzwR+qE4wv5E3A5vatDhunK/BUTWChJnZn0ml8qbuh3OR6roadbQO/+OF2s83VOAQNp9rorpD8cmoUIKMH9HZAGNsFQtlEcJZHNdzMHW4jV9K9vU2u4xVe/pJzE2qgtHA5NRJSs0amc3WiuCRTZFb+totW4cJIH56YSyZlz3YRGOl3ngMtH2XTiKq1QxuevwdEYLO2jekfdfd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ff58eqSiwWFq0VWNCfWqK4O8bXQmkBgaZM2c62ePiNg=;
 b=zHpYjfrR9FitRgbHFrz7wKjN3nFYyi/kl9I4jYyUshlLx2Cy7+nD5pvPOBx4ExW1hBBD1yR5s2e8XWnFcRCFU8wxvidrhLLG4zIP11yyjj7/MMwZOTsycNGfhStUx0AadOjcLXr0+2lvtLxYgac3APXZUI0OJmF64dnIvZfYGB/U0KxSLj0IfBnezSTGidsPfC5GvlvlrR/pjPE9d7JIADrJ+mJsw2GHpz8hF3IbLaIySI3SBQENl5N1fqx1aCZPLCuIxqhKehr8Ljb4A6YsAbK2NKfA7UgbxLSDMMBIg7gwSnl7eLfaXdwCnETEQfqExaAve2Og8UYNmTSSmcCoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ff58eqSiwWFq0VWNCfWqK4O8bXQmkBgaZM2c62ePiNg=;
 b=GlajNOikWQNCE00z/3j8dHI4HtEkgxmsIeNoC3ojZaqkGCuoATGWpcYyLFE4zfW2BbN6bs89kouwESDwCwMpi+/FzLi/twHhykdbFN4EZxN/g5SCeyYz89lNOXaFSztCVYNLpjX5GCCo7M/SePwmQRFo8GM/h8JMpUF0VmRvsjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DB9PR04MB8361.eurprd04.prod.outlook.com (2603:10a6:10:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:54:08 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:54:08 +0000
Message-ID: <cb699e59-1d5a-4e32-9c31-1bae48f660cc@cherry.de>
Date: Fri, 19 Jun 2026 17:54:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] dev-manual: add second way to assign "PV" for
 external SCM
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <c3dc6fcf-3e0e-f788-3308-1fac1fc4ea57@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c3dc6fcf-3e0e-f788-3308-1fac1fc4ea57@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0080.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:349::10) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DB9PR04MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bf340a-9333-4b9d-c24a-08dece1aff88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	h/iPP1/1BgRasw6zwgLTDW6zelcLniPJswk5UASBpCORIFzNlBECqK2rHtSiu0zXkyvadLzqPM1u+uinNQ75q09PVpAhz24en/AJeQUxSQzGg5imC6W70KFuJYtxodE67TjOxMD201b5QwKFbjB+xlyhFeXHEMppmro7fqVFvwUyeypIBdtZs+2Eh5rnmIaXYZkUtr4d6AYbwgdE4RnDVsRH8hvDCYd/V6W4VVYBoGI7rQTbformRR6a4IlIevxjIGe/7mwC0KJ7NzpBy6OH6u3wqBKXrAVWx/aFlNrGdKlvG+UvynNYa2QiyuEtdZb+ShlaE/96T3lbWg6Yc0cVCBWYCWcrLr0yH2qbjD2LuXh2fbyKHhx3xs06/hUhg0pXEV/JKL8whigIKaE7LlW+/i68eEA3As7qbXjCeYPIeIruLxDa3ezst0+9bT200O0ePEtM7ManyWg09DycsUV3Z4a4/XD3FxM0ZVbMNRs0td8eroAfLlkCokaMMMUB/MD4662r2rUS9PxC7feLfG++yZW3NWybEnFsBYec6Uw57bADRGyKYDcgs9wphnD+3ZGYssS3OHcSift+ZlS3M6xYpaId+dOFDmUgMz6K5Mwdof4sg692v28FLV8VuMtuDzEkzjJBF21xfRinMNkQsQlcTMZS7upG/uWf42hQgf3jYP8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b05kSEF1aXNZU1ZyZFBrbHBuVjF4RTFEenhXeFNlcFFHOWlQMW9XR2tBRmx1?=
 =?utf-8?B?cjJ2RXA1MmQ4b1pyek9qU1pMY2dwZ0ppNkJ6OTdHWW9EektkN0htd3ovQkxP?=
 =?utf-8?B?ZlBiQkVxKythR1hjZ0gvek1ubHdPNkJXcDJUdUZPUkdNc0xtb0NTd3ZrbnBZ?=
 =?utf-8?B?OE1BbmNZdjhGV29xT1AyZVN3SkdHc0QvSExIOUZBVW1wME4wYjAzbU9aT1VZ?=
 =?utf-8?B?eldJRW5STGZINk5MdURFRWJDWUlsZmZDQUxHNTVZbGJ3RENEYjMwNUZkRnVD?=
 =?utf-8?B?TWx4akhLVnBNejQzbHl0cmdCQ2grRkpuVXZoS3ZXVExzaTNUMUxaUU9IZU5r?=
 =?utf-8?B?VDBnUUZxS29MZU10bG5zdFVTdWxGSk9LcGIrSDNGVmNGZEEzZEVPN2lEL3Fr?=
 =?utf-8?B?MjlJeXJIMXd5Z2xZcFlRcjFMQW5NaWRYcmlUYml3WGFURndEM295cWlZRmNz?=
 =?utf-8?B?T1lLYTdqejU4ZE1hbTNYREVVdmNpRjcrNmI2OU81bWZrSVpnYkI1S1MzWFd6?=
 =?utf-8?B?L1JDRjdQTTVnMjNyNTkwa0ErRXJybVZoQk56NUgzZWVqc2d3L2F4WU5NUnE4?=
 =?utf-8?B?MCtmR3g5NmZrZWZ2cHdNYUYxa1k5eW9vUE4rTjNPOWdqZFAyYUgySVRBbGNW?=
 =?utf-8?B?Zlp5aDhta2xUOXNMUjd1c25kUzRjM3JYS1BUdDBDRHVVeDdYZTkrQU1FUHkz?=
 =?utf-8?B?VkVuUFVrQThLa2J2eXpEdWk3UmMrdm10L1VWdlJRdlNWUkxnam1XVTUzTVUr?=
 =?utf-8?B?MFZML1luOXpxb05UeDlVcGVQamYrLzl0bjlXMjVjNGVOdGI5WjhJVnkxNlJH?=
 =?utf-8?B?TWE2VmxIenRzQU5Dek50bE56blpQa3VRc05qdVhOR2txYWd4bCtIT2ZoSzVz?=
 =?utf-8?B?VER1K256VlEzN1F2eXhzb0JJb3Q1dFdWelNyYXVVMnpUaVZqMVl3UHIxeG1O?=
 =?utf-8?B?aVR5WVlpWXN1N280WlVCK3pkTHVjUkhmQUFYam9nTUdTdG5LaDQxSFBLWklH?=
 =?utf-8?B?aGlwUEpMdUZQbVZBR0lIVWlLVDUzaHhXTS9IVU1ldXZCUVEwakZuVk1nMmt2?=
 =?utf-8?B?NWVnemM0VWI1eEErR082R0JZemxzN1draDlZQmwvQ05pNXVyMzNQcVk3RUc2?=
 =?utf-8?B?SDhubWw4MFRwbG9CZnJ5TTYwcW03Z2I1blZmNEpCbmhURlpFdGx4eSsySXg3?=
 =?utf-8?B?WlRLSVI0V0NxcUFSQXNLNnU2dEpaazk4anE0ajlORGVyeTZhWU5hTWxhVDRR?=
 =?utf-8?B?UHlnd1o0OUxheWRmY1JEN29JOFIvUldYVm1hVDZDZGxldzFJa3pNMGEwZlJo?=
 =?utf-8?B?RXdpRHJQRWZlamU2UUpjUTNtSVpPdWhYSUlSM1BYNlZQRjY5TkJ5azVRaU5V?=
 =?utf-8?B?dEVTaWgwbVJsNzFLSndiS25zSjQyQWZtOFdHdzcyMWtZQUl6WjU2RU15dXpz?=
 =?utf-8?B?Vlc2TkpxTG5XV1FOaFpveDUvSm5nSWxLVXZ6SkNlZVRSM3E4SmtVNEpvYStu?=
 =?utf-8?B?bTBoN3NWa3h4dkhSWURkYlMyYWgyVW9WZWlKZC9oZVFidFd2ZXp4akl5YjAy?=
 =?utf-8?B?c0Y3azZSbTV6Wm9JZmRmUEdBYnlGTEZleTR5bzd1SEtOUC9FSU5QMEQyTmp0?=
 =?utf-8?B?aVNyaFNlNkpuMVJ4aWkwUE93dVEyWEZubGpxamh3SHJFWTRUY1VCN3pzOWtr?=
 =?utf-8?B?cVBZczBPWnRDVWxKdmlyWmdnZ3JOTHNTVnFoUitzd0p5ZnhtbjFpVmlwNENr?=
 =?utf-8?B?Zm5pZDAvRVoxNGZkek1aOG0xZ3VyZDVwNTFQcFIxMTJQM1Y5Y29oSGlBdzdI?=
 =?utf-8?B?Y3B6d1RsMFpZd21wejNXbEhnU0hpNE8xTDBPWkYrQW5hM2RNMG1Rb21kSlVu?=
 =?utf-8?B?bXRWUForcWx5cFlodU9Xa2JsaXRNSktBMENUTHVSSjUwa1FNVlEvN0h3M0J3?=
 =?utf-8?B?NkZJRk0wenVzTW5XQjFhQWRNS3ZFVElnWmo4cXVWUnFxc1htdzZoZUJ1Qi9V?=
 =?utf-8?B?YmdOKy9ZL3ZKYkJjSGhRd3k1UVI5SmtOMDRVK3I3RDc5QnRFeVgxUEkyaGFo?=
 =?utf-8?B?OWEydVdkdjNoVzl2VE9tQ1h3aitENVdlVHBVSHJOSnk5NTN4ZTRPeDRQRGtl?=
 =?utf-8?B?andZZWp3TmM4Tm1BYndlZFhhNXE4MksvZ2ZPeTV0bk92bC9GVkhxMlF1NFk4?=
 =?utf-8?B?YVFGZmxVb0N3MnczTWxsaFlZQUpoc0JQR1REQUNjVEFyRElhUFc2M1o3Zi9Y?=
 =?utf-8?B?dmlHR2JVS1hPMzJPanF3a0o1NncwdWlWODlOSXhyMjV6VytlMDEvcTMvM2ZE?=
 =?utf-8?B?dVp1VjlIYWFUc1hUQVM1cGtQWXhKUUZFQVFTZWU3ekh4MUs0OXVlUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bf340a-9333-4b9d-c24a-08dece1aff88
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:54:08.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuCjuD9qWsE39NFxy9weacRutxjr7h0JX1bz1FOlvNo8cBmetz7MxEx9vra0CmsWTRIdF6R1/FVst4T0251TYuJqZRQrpUWPYpQg03pW8iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8361
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9805

Hi Robert,

On 6/16/26 10:32 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> In addition to hard-coding a PV value in the context of an external
> SCM, show also just appending the string "+git" to the value already
> calculated for PV.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
> index 3ca9079b3..cac23ac1e 100644
> --- a/documentation/dev-manual/external-scm.rst
> +++ b/documentation/dev-manual/external-scm.rst
> @@ -13,9 +13,13 @@ Subversion (SVN) and Git.
> 
>   To enable this behavior, the :term:`PV` of
>   the recipe needs to include a ``+`` sign in its assignment.
> -Here is an example::
> +Here are a couple examples of how this can be done --- the first
> +hard-coding the value for ``PV``, the second simply appending
> +the string "+git" to the value of ``PV`` already extracted from
> +the recipe file name::
> 
>      PV = "1.2.3+git"
> +   PV .= "+git"
> 

This is confusing. Do you mean that

PV = "1.2.3+git+git"

will end up being

PV = "1.2.3-gbebedada+git"
?

Cheers,
Quentin

