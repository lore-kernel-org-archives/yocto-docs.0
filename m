Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522BEC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 17:27:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web11.16959.1737653229903077830
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 09:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=baftUFK9;
 spf=pass (domain: cherry.de, ip: 40.107.20.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hE89qekF3xTtBtZbPoaOMWADMWjH8DZfRg/BZrzHdO0Ts7PT7wgoQj2yvYbgqWQUQtO7KeTmx5wlZbU7yrtqcN/GRYf0PlJ9SfWg/9g1Jj6d7/xRwZuPGKlwDfVh0O3/QFma4UflnnnA147K0e5FBprnyYWQepReG36WF4zqzpt+wH6SBbP+gBtGD+13KCpp2XCDQUbCpEMchNMH2dzlATFSS8JggEYGKSvi5/r2J3ltJ2ZRjBnJ4O6WBOFfys+t9lBTz4gA50+vpV5To6AhGi2tlei+RJahQjjtjlMbqzYgUN5CT/a/sECtVQKig3aqlh2tvRW1Dr+ix3Ozy8f1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcYy0yr1p/7PJvzbiZM0ssozbNItxvk50Dm+nF8iK60=;
 b=hmHkIMjnHGH+0jLQwHQMxRm/pIyndkRDIpfZbCFwLTc4VItelKJ7DxtKqudEv9M2HYNfutA4TmdmL+zxm9wvnBXt4j7vLHyBwWl1VcQ1GqzUn7IgBG88+fU2ErZHPXH8RaeYsu3tG1iv73RnWdJGrjg4SjQIhChbkYfoRd6inBBbmzG4my+E0ROhhy0eHbal5w071gA8J2ctFsi9XRvRnjN32Y2rKa3VwSFYvHIbIg9EUkPy2k0VM0jxuREhJ7E+bShTBPk2T3N2B5RXS/+3oMlSsc8wbAsPn0YuKxLhUbrMh8Wjbo0UshJWRGfsKIZFqhAibp/hhZyTm6wz9vB3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcYy0yr1p/7PJvzbiZM0ssozbNItxvk50Dm+nF8iK60=;
 b=baftUFK9jXiO9KdT0jDrkeXzF00ZKQwXTob3/YgEdViJHP1lo1r6V6Tl3GGspStyK0wQ/ZG46lFyZU+xqn04glUMPqgfr4CFAEVRmK9TU1typBNRJ6Lz/Lt8KkClHOLdoRzc2zjHQhDD6BAW+Tbsy96HcLreXU0nZRSG9N3dO/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 17:27:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 17:27:07 +0000
Message-ID: <87be163b-5bd6-48af-9bda-bcc2b77ddfa3@cherry.de>
Date: Thu, 23 Jan 2025 18:27:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs][PATCH v2] test-manual/ptest: link to common
 framework ptest classes
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250123-ptest-common-classes-v2-1-71d6f80573b9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250123-ptest-common-classes-v2-1-71d6f80573b9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f57544e-3518-4121-464b-08dd3bd3295a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGNpRkJXd3JMVHBmNUtDckMvZTcraFc2V2ZWNGRXR2k5YlBnWldkRS91RVlR?=
 =?utf-8?B?Umt3TnhYaStLZGhGM2tTQyt1QVpZbjdGSHlSUEhnQVhaRlB3dXo5cDBRM2hn?=
 =?utf-8?B?Sml5QlBORWdCS0RoTUpFYTZyMExWTnR2WDJWVlNTMk9OdVVhZHNxUW9JOW9B?=
 =?utf-8?B?WWR0UmZobzkxZkJOTkVFZHQyTVF5d2VicFllb0kyQm9zblF0dDR4MmQ2aFlP?=
 =?utf-8?B?aUdKdjRrRlpmYjJ6K1Bqa0x5bkVpbnRGN0t0QmcvSC9SSmcrdEd3bjVzTHV4?=
 =?utf-8?B?ZFdCNFR2Y3RrM1JTT04yZXEzN0xKa1h5dFVhY0F0YXBzRVNxQjZPTzNRRVJM?=
 =?utf-8?B?clhKekY3enRWWkZET2RUcUVqOGY5ZWV1Ym1xMVdjSGRUQWlUZmpTTWZDT1Ev?=
 =?utf-8?B?VEJRbk5HY281VnJ5OVVzdElJVzc0TnBSUkVaaVgvNzEyRFJLV3c2andJcDAy?=
 =?utf-8?B?dlJ6cGxNbGpscmhOQ3gxQVRKRkdlMWpWNi9ZMTk4ZDRSNUR5S3N2N0NBa0tt?=
 =?utf-8?B?aDVpTnB6SHRGaU9OYkZMd3pFTUNLWXZ4dDFzNTh4Q1BZc0VqRTNzUjIyalZx?=
 =?utf-8?B?Rit5aklzSWdDTzE3Z1lxeE1vOTdWRkZiYnhQVXNLS2EvT3BybnJvMDljb0VP?=
 =?utf-8?B?eTdTSjlsTWJ1aFJWWXJjR24xaysxOUYwUExLOCs0enQvZmNvNCswekh0LzRn?=
 =?utf-8?B?MElyYU9VelowZmkwdzBxWTlBWHl2NUhiK3JRTTErb1dJSllkc21QbG5RZW5n?=
 =?utf-8?B?b1NRZzNIWDdxRFR6bjR6RkRwbUJCTUdvekR6dmxIbTh2MjdLZ1kzM3lPNUR3?=
 =?utf-8?B?ZHdTNmFRR2t3bmVrZ0hiYUpBZ2tNMzBZeFZ5MDhWUC9lTDY1Z2dnSFJpRnJV?=
 =?utf-8?B?Sjg1S2ZDQit2cThMdzllZ3N4OUEwNG54NHlSYk9KSjhyckY4cTZHRC9zTVlp?=
 =?utf-8?B?dFV6b3F2ZEJDNXVWSkh3S2xQajdRS1ZCQVNhd0YzcjNuTmhZaUVkN1JHWHR0?=
 =?utf-8?B?TExiam1QZGFyay94TzVNektmWjhMckk1Mlp0MThSVUgvMDkrV1hicGU2aU5J?=
 =?utf-8?B?aXgyY1RMNVVyTnp1MXJqY3l0OCtGeEFyM3BzREpOcHR3Z01YY2N4ODA0S0U3?=
 =?utf-8?B?RitzZy9sSFpNY3kvMnFyclQ3MjhQUyt0RmNuL0I3UVRLOXcxWnBZT1U4OGJ1?=
 =?utf-8?B?STJMMzVkc2dYdURmS1RrN2d5amltWTNGd3Vad2hHZERjaWJsQjJBb2w4bHZz?=
 =?utf-8?B?WDdGY2xkRDZxNld3WEM0ZjZNU0htVXpURUI4clhxVlBEVThzN3QwVGlVTVVy?=
 =?utf-8?B?V0lqMTI0dGtGaFhkZThQL2Jyc1BOMitlK1JQcWpyd2V3akxiblN6ckRGL2pl?=
 =?utf-8?B?ZjA5Q1g4Z09KSURSa0tVc2UweFZrZW12QU56dGRITUc0ZUQwZU83dUNMRUlO?=
 =?utf-8?B?aS9zUDh3RmFuSi80Qm41YThqdTd2NDFPK2lJandURlY5ZlM3Y1k2ZHdkajgy?=
 =?utf-8?B?TjJHVVVYSWhDYVlKSlVRcFpWOW9pRGVzUWJsOGVaN2JEYjRBQm5sNXQzNjc0?=
 =?utf-8?B?eFIxMnlBVHFZQUh3NHliUHpvZ2dTNmdDNVQwNytjbWY2SmV3Ty92QlBvWHlU?=
 =?utf-8?B?VkcwVUl6a0ZYZng3RGFzRWRPNCtodVE1ZEhrTWtiVjM4VzM0bWYwZ09HMmxx?=
 =?utf-8?B?cUY2K1kvK3IrKzEyN0xPNmptYzZmcVBhTzdHNTNkaTdtNmpWWGlPcUFYMWpO?=
 =?utf-8?B?dHpZSndOVFVTSnNxSG1Ob2lzcXhnemZmekMrS2VKZEVNbnp4T0hsRm9hN0Ns?=
 =?utf-8?B?eWpVbVl5MFJwTDc1aWdKcGdRaW4rUHpQV3FOcHN2WUhaUjRwMzgrS0lXMXFT?=
 =?utf-8?Q?4HICHPBFV2tNT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dE9oa2lqejlNakI1ZEt2ZTJadkU1MlN0UStZcE1EaXRvYXl2VnowWm9mVTZr?=
 =?utf-8?B?SHRvejdDTXRTUkJvRzJKanYxeUFpejRzRklZNjhSbUFIUUZiaCtUUUQ2SmlL?=
 =?utf-8?B?SWMySy9Vbkd1dWlpTFU2aldCS1JWZ2hHYkJkL0tRSlJyNWVyeEVGWDU1a1dX?=
 =?utf-8?B?RVV3VmprMTlUR3N1bFRzVzRqcFJlT0JYRFJ4NGRKWkw1TTdqb2lrOWZwRHBJ?=
 =?utf-8?B?ZjhlVmJPWms2UzVQR254S1FmcE8wR0VtRHNidHpTdGtjbGx2OXlFRnFEcDRo?=
 =?utf-8?B?NU8yU1grVzZuK1ZVY2Y0b3g4eWtLK0dlQjY4d0ttREIzRkRYUDdMNFB2Q2pV?=
 =?utf-8?B?bVBpWC9BUzZuNmlBRWdFY1ZhQmtjZ3B0bERQU2pmenlzVGpiMmdnY0NGUjds?=
 =?utf-8?B?WnRSNVJGUGFacUNocW1mYUdXMlBkRFBrU2xRSFJoL0lPekZEWi9EbDVPVTQz?=
 =?utf-8?B?bUVjdTFGT0lCcXhMdnVuVkdCcUljaS9acGY3aHpxQUxxTjZvYmtzQWxkQXNT?=
 =?utf-8?B?RnRYNVF1UkcvSzYxWk8rSGlHTFZGRHR3MnlNSG02Q0FxRFJ5NTJ2T05UQ2hx?=
 =?utf-8?B?Uk5JbzkzakthTm1tZGxuMkk5MXp3Um1FOWxQTVFrZWlpaEFycUVadDI4NnA0?=
 =?utf-8?B?NjFuQXlGUkdlYzZ0V3FOWWNwYlByeEMyY3FMSG9rQnNqRVJ3Z3JORU5OVVpq?=
 =?utf-8?B?TlQyUElncXJoWk1KT0pjT0Z6M3dBZXJOZ2VRN2RFcEJPWEozNXhWNU54LzdE?=
 =?utf-8?B?cnFKU3crUUkyeVZreGczMFhLUkk0cWl0aEh0N1NxVFRYODdJbnIzNUZ0TEZM?=
 =?utf-8?B?ZlZkbWdKaGxqTzhObkxvMG9hbjBiNzl3d2RaUTZHK3RoRllKWXhxNlFqV3Bx?=
 =?utf-8?B?ZkI1UWh3VXFreDM3b3JQRzNHQnY1WUtuQnFXZFJMTkVCSTRESndteG1ndUM2?=
 =?utf-8?B?SUliWmxUdzRUZitNdnlQM0U1aGVYUzFqQzlqVEJ3UUk2dzFWTU4wbHdqYk16?=
 =?utf-8?B?OTE2SEdXUUlaZkhFZktnVFoxYTRlRldUMS9qR2kzbndDTEVLUm91M2ZLaTN2?=
 =?utf-8?B?Y1c3NVorbHh2azRWbTg1a1N4WEVybDFCUGZnR0hPVUg3RTNoZ2tWMlZtLzN2?=
 =?utf-8?B?QmpQVlVNL28zc3RLTTBZU2JJbml5d01ualRwRldMRHJhQWpKNmgzVDllbzBC?=
 =?utf-8?B?R3NWbzlKTVo0a1lyT3krZzF4K2xHcTM5MHBoMSs3SFhTRzNSU1ZJZWVmbFJK?=
 =?utf-8?B?UDUxSG1iaUdadTFrc3hTaEpuR3J2b3lrWmdTekpIQ1RiQzRjUGxFQWE4YjN3?=
 =?utf-8?B?VjBNWStoZ0tRdjgweGROcjg4REtQWjJFalU3eGlrNUlUMGV1RTViQWJBOGcw?=
 =?utf-8?B?UHB2TCtFWnZYdllZYURQTnJ4TmsxL1owbW5GVlRBZlMrMFhPQnd3Tzk4V1Rl?=
 =?utf-8?B?V3g0cllVOEFZZUZkc2RuV1BzSy93U1pKN1pMVlZxQkRDSHgyenIvRUREby9T?=
 =?utf-8?B?QVRUdERFVEF5elVYaHNzalpIZkxLM0hDVy8zeUw2RUJHMGtvM1NPa1cwMWFN?=
 =?utf-8?B?VVN0dTRGK2poY2hucWdjMEVmb08yck1IQzBaVk8wWlRab1FKRjJkL3Q5RFV3?=
 =?utf-8?B?Mk1sck9pd21YZG51ajhjZFU3MlpqQ2NHdERxR3k4azNHd042aFJ2OFc3U2xy?=
 =?utf-8?B?eVRXemxSS2NENlh4THlzTmpEY2FaOVVzOFVmVlFud29NZDBJTjl0QXh4cnYr?=
 =?utf-8?B?NzhCUmU4eWViZFVNRWRDUmluK3R6SnJyUHpZT1VRRWU5L3dlTlFXN0t2UVUw?=
 =?utf-8?B?Q3VDNVAyTmxBSUdQYnRMM0ZnV2tCNzI5ZldEZmc0d1JmdlJKT0Ruak8wZmhM?=
 =?utf-8?B?TFRxYUd6RnBvMEtFOExxbHZMSmU3OTAyckc5T2E1dC9wL1owUzF4KzZsME8x?=
 =?utf-8?B?WXRxdmQ5M3owMkJKSFVMZXhjaTczTmEvY3NLU0NDS283d1FCY2xIZmp6RTZl?=
 =?utf-8?B?Y1F1Y2RNWnJ2ZStRRjBDLzVHbkk3R1MxdTJqamt0ZnBPM0FBNnRhbnU1WHBY?=
 =?utf-8?B?enFHWkVJblVkckRjUjdVQXFzT1FNWXppeTFWWjlYOWppcjNDZWc3c3o5eHps?=
 =?utf-8?B?dTZDd0EwTmJuT2VUQ1JqY0NOZ0JLdEprd1JwM0lJdzVwendpZ2FESDFjUVhk?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f57544e-3518-4121-464b-08dd3bd3295a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 17:27:07.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuOrRpODcHcGMx2DiVtuXkzunTEtIyukqFQHdrH0UvOJkyAjPI4CEwhKq+qDcRgbD62IiyTNUGTgFDP6h4DYcTHeCsgKqtAXWOYhWrVjjrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 17:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6167

Hi Antonin,

On 1/23/25 4:48 PM, Antonin Godard wrote:
> We document how to add ptest support for a recipe by inheriting the
> ptest class. We may as well tell the user to inherit a ptest class for a
> common framework which does most of the job for you.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

