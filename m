Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1205BCD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:19:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44808.1781882381370216700
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Bq2caPx/;
 spf=pass (domain: cherry.de, ip: 40.107.130.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiDsk5AcimIQ3+ejQnU5diGz3UqwNAZGeJIQvQKk6U+QyNgb+ziz9BgJHW47nVWo5YfhQl8Wma3dAnR9Cp8a/Etnrh94BIenFNul0d3GmU6qWI+OzNUsFctIEg5RQjmUfdYBq8tFP7eCf/MElm3J11r93EBt4NSrD4p21caaEgtM7YJ+4KouGXE2cnl2bhD7Fj58V9Gbe8628KCjuui5yviULLzrVEVoD72w0r/MWrP1zmYWaZp5cx9g1KJM2M6mvWOUcdqx0KL0/f4B8JnWn4RnpPqNFTeYdPy8Z+ufbvFmMK5bafSBlEzql7z/8ZvhhNQdTmGMsf3mG6Y4xQNZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9k/svjodQs6CDnJ50LR7d7sTNrtVI9ueFaPQgVIDU4=;
 b=WpfpuO6SVKVc58i55uo6ReALdVu0whZN991ZyuIrYW75bALZTE+ObYOmQOVhYfBIfnoI8KN742xaq9s9XuxlpyRkB52+a7dFcBsflzBxtAIsdO9UpqjwOIv5baOE9wVoMylIM2XFZeYZxSLD9urXN81Npy9n8L1Pb/J0OWXjHBlvPFzuC2auAdq7mVrcexLEHwqYSH1cMH9jtMin5YzK4NJHHh1nlH4znlex4MkPC9jL5zZ3e0gxbTXeavzVIGP6PlMfmS5SZmJphqyzo2XwNDwzogrsWa4f9DU06tIpGqMUbNc4SDBBkgWqeJUjXnMeqA+WI9EluU6zg6p7kbNI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9k/svjodQs6CDnJ50LR7d7sTNrtVI9ueFaPQgVIDU4=;
 b=Bq2caPx/SMKGB1LJs7PReLwnI7g7fkM43pPVkb2gpe+380cL8dIkVlj0C26D8zuo+1exCGMpyOk822a5nYPiqfM0S9F5TgK2nND7zp/dKuf7bdi944PhGwDtHWZEI0o7eAapOwg0n1gLnupZdAl7dOAHkiGBhcLLvfN279RqyqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by GVXPR04MB12127.eurprd04.prod.outlook.com (2603:10a6:150:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:19:37 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:19:37 +0000
Message-ID: <b6b3b322-cbdc-4518-96a6-3fa76aa20fdf@cherry.de>
Date: Fri, 19 Jun 2026 17:19:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: Emphasize that use of Subversion is
 uncommon
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <4e4b3cbb-27ed-e6b9-7369-2f190cf3969f@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4e4b3cbb-27ed-e6b9-7369-2f190cf3969f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::25) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|GVXPR04MB12127:EE_
X-MS-Office365-Filtering-Correlation-Id: f3de5e49-8d7b-40aa-66e7-08dece162d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	H/o6v2npvoAVnTCk8aK9pH1E4N0aq+CFbhGSatbLP7N7/oFfxpAesZeOBUldX8bdbSkyidcgPeCAPF1eRtDsxWklABSyAzQ+IiYJ/b1/GriSJw4RmbZRouhZSUi1BH9LkAyErSgpVs/V9YXdu9CYaORy7oKX2Hw70zNzoaPs5AGcq04bvSWkWYIYCQ4vdDl8gS2r1AIrgQ0CMfq8Rn59qOjM/q3ncW1dv01UIdfOkeRYnMjOksDl4Is/cyJA1+o+SZFD4lAdt8KEeJYYKZ6Jg+oyKIGxuAHn/ISxeuW2xnU5nW/BE0ufoZtkaDH3ca9HJGuQ8FmynQ78Hdwpg5DGoih8Jpm1zLWqMB6R8RNZq+SThBlZ3ns0oF9fqYG4U3vj7spgbQXYFC+j8ujKhcD4WG5QoRqla37oVoBLlo8aHipumU2pbHJ5Zt2j+0rY2LUkOGIRRsi8aj3SqWJL3FkXDadLBU7sltwHNFrtPWISgk8BHMPOxUdOsoP+aK1lV6uVazDm173eaz1ftnmimqQwNeHfGbMVlZdD+fc3wNP3piDbRgAr008u08rnlEGUppn90Y+H36Ii+UncDjtLOzRcUN4nO7eGjDreCzln9BMoe9lzL3XKwJ+kXQs7MEocR4dQzFvFWcJ3JTqleW3msfe3/pTKhdp+pCJoJlvdgCGEHTs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?anQwRFlQMVpESXZTSjNvTksxYXZhZDN6N3pRVGw2dkcwc0FONkMydlVSM1U5?=
 =?utf-8?B?TitnK2NZUWM1dFpob1ZVdnFFNi8rM01YKzZiZTV2bUcwRlFZUGkybm5vY0x2?=
 =?utf-8?B?OFNZYVZFVzBjR3BsNGpUYnRFbzdnRCtaUVBRcjZxMUUveHlUT3dJRFNQTHQ0?=
 =?utf-8?B?N3phcUR3bGV3aHUzbTQzdlBwTyt2aU8xR2ZqT2NyL3lyblRTMloxQTB6WnlP?=
 =?utf-8?B?ek1yODhHeUdqM2loa2ZaQm8vWVhqMFJnQi80VVM0V0k4OTRCSDlPKzJzUW1T?=
 =?utf-8?B?eHN3djRlN0ZMd3MrUUZBODlBTVVGdWs5OXhlWmp0dTFleFpiWS9ncVFPcHBo?=
 =?utf-8?B?WVU0ZndkRkxQa1JNVXhXYVBQUGhnOUNsM0RJb2RIRzVOOWRFTW1FZ3pkYXVx?=
 =?utf-8?B?UmpLRzBWQUhpNHFaZ2VBMEhsYjV1TUZ1Nlh4SHpWVmRXU2w5V3NNcXh2NExI?=
 =?utf-8?B?MTk4STM0V1lQNXlWS09SM1NaanpiY2Jtdmora21DVUdXK2szTURLU3VaRk40?=
 =?utf-8?B?Wm12OXVMYWljRkNnTlBUSzUwdjF3R2grelRyNFV4ZXB6NEpNVm9wUXRObnlY?=
 =?utf-8?B?Z0plQmhlNFNncDNWV0FCeXFudzBkNmFWa2VDcXNwMjZlZ2liM1NZV2pXQ09P?=
 =?utf-8?B?c1BOczdtUktwL0ZMMXkwSEVpcXg5Qm9lQnNpQ25VWHBiRlFuRmh0ZGpCclJa?=
 =?utf-8?B?Z3V3TUlaV3pucmpROXpEOFczRkJESlZYRHowUzRTYkdERUg3ajJuK05VbGFs?=
 =?utf-8?B?MzV3a1IwV0J0alIwR0toSzl0VlZRZXhua2tDT1BmQnQrYnhyQnVqM0FyRHA5?=
 =?utf-8?B?N1VRamdEaVVacFo5WDUydVBNWURVQ2duRjFZOHpRS2ptZFppbFZwZ2EzZTBo?=
 =?utf-8?B?VkV1ck5ZTlN4WjR6UnR0UXJENHFkTUtjOFRlbzNnY3VTSFlVbUlxek1GaVVm?=
 =?utf-8?B?YkRyYzZIdy9iYjYrRzVENTRCSzBOL3RLRnF3d0IzV3RuSit5dTM4c2ZMN3Rj?=
 =?utf-8?B?Y1FTSnJUc001TnJXYWZKdHNwMS9iaURjUlo1VTJPRkptMGdWQmVhN1ZpU2Nl?=
 =?utf-8?B?OGdrMUhwOFU1VW9kaHp2UDRhMXJ4dE9reFBwbk1KaExIcm9sWm9IOXRzUUhF?=
 =?utf-8?B?UkFEbVNMZGpORHBwOXBkSHBpdXRKQlhqcGJoZURxY25CdmVWZ0NjelFPajRV?=
 =?utf-8?B?Y000N01DdFIxNGRiM2l1Y292dU5vZ28rdEo3Y1E5eEtMWVVvelpuYm9sM0g5?=
 =?utf-8?B?VnFxZEF2QnczZ1VPVFRwRG5ZMUQ3RUpaNXdHcGw5U0JaN3lycW1Vb3BSbjk0?=
 =?utf-8?B?c0M3SHFNMWlkU090bUxoUFdpWmZ1WDVnaytFRzFsWWVNM0pCdk1jZEVVSmRF?=
 =?utf-8?B?M2JGWi9jY3lLUDVQbDEwaU03cGhBa3RVSFRKck00Qk9FZWp2YlVXdkNwaGZh?=
 =?utf-8?B?YmUzeE1WenB2L0VySjI4ZHl1cWpxaHNzamdWZDVxcVBpRDltaW82WUpadnIr?=
 =?utf-8?B?WWNsN1pGbitBVHUzNDA0NEs3WHFtb0hiMHZSWTdmMmVCYUNmTDJFY0hhaDBV?=
 =?utf-8?B?eDZYcUZvMktMZ1pKeVVkWk9BNTR1UzhNdkovVTRrcG11NVpSeFdySWhoYm0z?=
 =?utf-8?B?bEN6MFc5OTJxVXg3SWkreVZCSkJDcVp6OStoYnUvNzlhT1c4WDFGMS90bUE2?=
 =?utf-8?B?amlHT2VJK2lodXg2clM5aU5paFpmeDY3eDBDRlBPNFZpbklDVmlIZytkTUsy?=
 =?utf-8?B?dkluMWVLZjk1aThEUEFpc0h6R0ZLdkhDTDBYQlFGandiZzQ0STd2cEhONjlC?=
 =?utf-8?B?ajQrT0ZWME5IblpvVGxhNnVmV0NVTE1pU3ZQWG1xSGsyR1oxaHBnSEhHWXFM?=
 =?utf-8?B?N0h5Rk5Ec1dCcG9VUG9TYlJpbmxRbFlqU1RobjZLTitVZ3JBM09JQ0FYeUZa?=
 =?utf-8?B?YW9OVHduczJHTklnUExjTk9wM3Y5c0pHUFd5MTN5a2NDUW16NVFtME41TndU?=
 =?utf-8?B?VldNMGxWZEhVOFZ3MTRObDJEQkIyTEpabytCa3BvUlByT0REbHRtdmx3OUx2?=
 =?utf-8?B?VW1aTkZhazNiS2IxanlHY2syTmtvSWFxOCtiT1dQa3dYQ2pSLzh5MkQwdXQ0?=
 =?utf-8?B?dXMrREROKzdJcFVNa055bDJTd1BVTXVFcVZjUzN6cmdDbjRSS1V2YkpzMitL?=
 =?utf-8?B?ckNOa0hsUktJR1hHUXVaZ1dKc0NhNnJpSVVSVjV4SnoyU1BEVjZoNFVZTXc3?=
 =?utf-8?B?TUpPS2JQdlBvSXk0dzJzdG1aelcrYy9DanZvL2VTUkNGUmxVcGQyWGlLcXZt?=
 =?utf-8?B?bjJlVXRJTk9yNUdGZ0Y2cnlMUkR3TmtNMGNEQ2xCcVFnd3oyZENoQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f3de5e49-8d7b-40aa-66e7-08dece162d38
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:19:37.7864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcW1rxF5eK6rPm/7X3y7+/pQyBqpB+QzFKhE8Np6A4QEygnTM/+vLTJ7BUa7HPEpQvRiIsQOjkiQWSZifFrzkjIpj4+osxumyh/OraBt4zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12127
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9798

Hi Robert,

On 6/11/26 11:57 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> At the moment, there does not appear to be a single use of Subversion
> in numerous OE layers, so mention that it is effectively deprecated as
> an SCM even though it is still supported.
> 

Why? How is this helpful to the reader?

Cheers,
Quentin

