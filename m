Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CD6D2FECE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:59:02 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18308.1769536732631971559
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 09:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=j77ZVTp2;
 spf=pass (domain: cherry.de, ip: 52.101.83.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPbzjbRto3IvvYahzD8r8vTaX9hMtNKQUL8HIEcH3ZURGWtkob/5l9haH7kPe3DLA0naKa2R7fUtUwe+Z5se5gwvmZYarx0MN1ZhVLzgG7oJZ5dcb9TcfUAJY1WIHQkPCc1kdXP3J2uW7kCEgjAhxJ70c9N/EEKKy5QJOOGoNtVk5+Gvh39Pq1LsSrsd76p3Q1S3cMa2vGi4nrBnb4CcVLALfVwf5AyKrwZ1UQYk4OAm7JOoBhmUGftoVq7JrDhPSKbkYwI2y20vKrqKCm3VQ+/1TeHbUX72CYxq3vGoUXOABqRuiN8kl4KZNQm5Gq6qV+oNnmzZ1lyiw76vfLwDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efRABvttQSjQzvL20/szEcnZ0Wcfo+d1j90dt0HCxJw=;
 b=gvtYW6FKVbey151P+SgVMKTun2uW8gZRRCqQtIrrX1WtMx5PkQMN/RHfe1aXqebNXnwKu1NHOJix+LTeXsg7ad6DhmISbNlpPZwXYEXhgfHcYUKqMd2fR82TbcjemHqGIwLVAG1mksYYnRJD1Brzlniwg8n/vk3D8t3wXaUwNpbSzwovap5JfLFPCfm+B/gfMD2dp3UY96SnN/JaaK54KX0vkyLsrhwZ2gTd13Ei2JWR1bp3IpQefS3k4L5VOdsNECLhnyieoZZ91mHvQgsQmPnq0li5D+Bjx9P9FYuKgnYfxhA38mFU9RECFTnd8jm83wDHyoASE97H/06BnQj3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efRABvttQSjQzvL20/szEcnZ0Wcfo+d1j90dt0HCxJw=;
 b=j77ZVTp25LGBAkthRvCMs3lfVG5H1Z7O+aPb5FGnDtMLljJjvc9e4SBNX519dYvsDweQVbyxJP7Rn91C6lZTcx/IXTCLGL5RaCMgH4pAliFWg00kgUd7+BDaqTJwrxZi++rB4dBK5CqDRWeOQi2mVR0IgmI8Eycuifk28tM4Ptg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB9802.eurprd04.prod.outlook.com (2603:10a6:150:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 17:58:45 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 17:58:45 +0000
Message-ID: <fdf3a9bb-42d6-44fb-8ef1-a59c3833d7ee@cherry.de>
Date: Tue, 27 Jan 2026 18:58:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 21/56] overview-manual/concepts.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-21-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-21-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: ef58095e-3e19-4edc-3c05-08de5dcdb6d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bFZ3aERoSzNlNE94NmR4ZHJtVVMwTEVOUnZSeGZYRzI0SU9Zcm5aa052WC9r?=
 =?utf-8?B?VlBxUFpvVjdTVXV4TGkzZmUxVXVUWWdQOXpYdEVNYjFUQ21UaHdRL3Y0UFJa?=
 =?utf-8?B?ZUNzVDlVdHJ2Q0lKNWpuRklwYnhwMkpsZjN1WXVrUk4yYjkrTmROV2g4ZllK?=
 =?utf-8?B?emtjUExDY2l3OFZBL2dCakdYSHl2Z2tnT0RYbFNCcXZGNFRSQnVwc25uRkFr?=
 =?utf-8?B?UWZkd2FnbmFUclhyVk5QQ20yTENoa0NDZks5MkZBWjR1SElTN0o0eC92K092?=
 =?utf-8?B?UXNOZVZ1bXlLZDg0cGxobXc0WHlrdXlGajl3aFZNN1lLb2RPekFIelJDTW05?=
 =?utf-8?B?YkFtYVJPWVRzdWJLOEttdjd4akI2QTZaYS8ra3p2cnArTmZObk11ak5Sc0o4?=
 =?utf-8?B?Uk9XbENEV2RBSmJDRDRXQytpUi9KWjVoTFFEdUQzZDFJRFZjOHVjam9BektH?=
 =?utf-8?B?dFh1cUt1cWoxTkIxRFNnbDlaeWc5YlVHbUJFc1VHd1A5d2dWaGhLMURZcGlM?=
 =?utf-8?B?RHlrSFpIWWpUMG1QYjNPN0VLUkk2d2M3S1dvWXRYS1BjWjc5YmVqUW1ySDJO?=
 =?utf-8?B?Z2hyTXJJYWU0cGpRYUpjbFNxRGllSUZ3OGxSaVBXMEorNXhXaWt4TWkyUjZ1?=
 =?utf-8?B?QzhjZTE1V25qVjhweXlJT1pxOXNuNWxDTzRIdlRUeXQxMWZRRENzajBOQjJ3?=
 =?utf-8?B?bVR1RTJISTloRVRTNnhxaEVUNER5bFNucGMzZC80RURwdEJPN2tVVnBxRzJ1?=
 =?utf-8?B?ai9sRmkwZGdmZXFUbk9sR1BRWXhMWUpJOFFkdVZiKy9QaVhGWFN2UzN4RTFu?=
 =?utf-8?B?S0FYQ1JzcUQ2QUZGa0xMWUxpYlRiWTc0QnRWY2RIeWdVRFpEaytKTEU5V2Uw?=
 =?utf-8?B?V3JucDJQcVRKb0pxQTJGUVMwVTJmbHQvSGxFQzFlcXM1SFRtalphYmYvVWJu?=
 =?utf-8?B?a2RBSnFKdURMR0N1TXc1Qm5ZTnlpSzYyU0ZlVUt4UHdNRUpxL0thS0VKSDBK?=
 =?utf-8?B?MjY0Vkl6bFZPaThIOEs1OEtqR2NZQTJnSHN3RzdZWW13UnJHRk9acFlDM3FR?=
 =?utf-8?B?ME02bjJTYTRGRHkva1JsUHZWTlBEeVByNkdRMW02T1dkUXhRL0pkM3VLZXFx?=
 =?utf-8?B?UENKekpPc0ZiZzZyVTdod3JtWUFLaGZaRkRKYXluenljejlPei84anowQlpV?=
 =?utf-8?B?R3dDRStuQ2JYemlrbDdkbGlHT3VkdlpVdnlTT3hjcXBPOVp4c0hrQW8vRnQ5?=
 =?utf-8?B?YTNGMVAwYzVnRWlNZDZ0aDhoQUh2S3dRbnNDTzgyVHN2bWNzV21wVHBDdEdo?=
 =?utf-8?B?bFlMVDZ2QUNiRXNLZGdkaVpMemRqSkd6WlZVK3B1cHBweWt2RnJ5Q3lQNDVh?=
 =?utf-8?B?YW1vR0I0UEhSa01vYXZZV0JyMnhvZndLc0FkTEdSbUdNNk1DVXB5UU5hZHlJ?=
 =?utf-8?B?akU2V1JweHBlL2tLYVJZZHN5RVozZnZ1SW1PSUJYV0FXWWlUcnBXL2czamoy?=
 =?utf-8?B?Ung4TzZmZDBIZ3YvK1RVK0tnMk9vTDNGcXVxL0RZNzJ5V0hzcXdicEMyNk44?=
 =?utf-8?B?VGNXRUdsZlJvMEFnWlA5dkxUNk53eG5YTHZlbXZoZW5IeWczOU9sVGhrQlFY?=
 =?utf-8?B?Vmt1QmNxVjNYVWJINjJzazlMNHR6eVVtdkNOU2hmL0h6aHNxUUw2cnJrdWxP?=
 =?utf-8?B?d1Mxckp2MTgrZ2psQ0k4ZEc2aEJTd2Q5d2FMR3hjek8vT0NoOTA5Q3QrWGta?=
 =?utf-8?B?TWlkdTNLRXpYVDdUV1hnSHRGcGVZQndvNm9vZk1CVTBWdGNTcTRRVk9UY2V5?=
 =?utf-8?B?ZnJBZXI4c2R2dGYzcUsvSmgwdFA4WlpqMmx3OEdlWm5qU2QrL0xFem41bjU5?=
 =?utf-8?B?Ynd5aFptZFc4MWkyYW9UMmM3eXg2S29CZDVaanpHRk02UlQwemhEYXpZQXRV?=
 =?utf-8?B?Q2pFY1VPeS9VRTV4cVlHaTh6K3R6S2hlRDVWNnhjaWJlS1J0MUpDUXdJbFdh?=
 =?utf-8?B?RFFXSlh0ZUk0cWhFYXYrZ3BQdG1YMXhjajhyVmdvbVg3V04zMlNjb2twNHpB?=
 =?utf-8?B?d1lPWVdpUzJPY0ZhNEpsb0kvYXdwcHJwcTZ0ZGJRemxsNzkwejJsdEFaejVj?=
 =?utf-8?Q?eI18=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGRUNlhxN0FTVW56NDlBN2RQZHVGSTVSTllWYjY1b21GZ0NpVFJBV3RzTjNM?=
 =?utf-8?B?NDBQRmZGN0c3ZzZPaFNPNnYxdlc1SFRmYTd0dFdySG93a1JEYmhDWlhNUWls?=
 =?utf-8?B?UzlWUW1wbktLdVRDUGNRekdxMHovNWlRcE14ZHRiUDZmUlpnQlF1UlZybkpt?=
 =?utf-8?B?NXN0clpVeGtMS3VhUXd6NHdzTk40eVNodXdnZGsza0NGR2MvNkdEQjZEUnlQ?=
 =?utf-8?B?d0RaN0tsdVM4RVFxdDA3dFBKbU01N2IxdVlYNzVYR21xbVlMOTZLb29uYmhR?=
 =?utf-8?B?czgxMHc1S2M5Z1Y4dnh3dzZRVnM1TWdMSUloZHJ1WDQ1b21GeGJIVWNMUkla?=
 =?utf-8?B?dm9yTUl1V2FZelhWck56L0FtUzBjc1FOZUF2aGcwUHpEV3BxTFNnRUIrQ0JE?=
 =?utf-8?B?anRqTkZxTWlqVlpZbU83d0V5dGVHTUxuQU9mQnFLalRvbVhYZnFuOXppUzl5?=
 =?utf-8?B?dzlKSjNjckJWcWk0UFQ5K2dhVThpYm12UlZZcUU5V0NXUkM0eHVycnF0NStR?=
 =?utf-8?B?Rm5QMnNac25xZkxkd3JZTGExRU5LeldEZGVPUWdNRHBrbWF3Um1oL1k2NDM5?=
 =?utf-8?B?bTd6RE45WmZ5Q2VseFhya3RvV2hmdUQxMjlTZFVXblFFOXhOa01JSkpwMTZH?=
 =?utf-8?B?ZUZ6M3BlZ1ArQkg0RDB0MjBQUHBjUDBIV0VNaUVVTCtLMVBZS1BoRVpGUjB2?=
 =?utf-8?B?QmRVL2l3bEIvbmRRU1hpcXhneExOV1J2NzRjZXJHWW0vMjgyRXp2WU9LV3Ri?=
 =?utf-8?B?T2hFVG92SUpGM3JDWDBOZzBscjI3QTc4UUk1WGx2MGdlZ3h4WnhGS2gyQ3U0?=
 =?utf-8?B?MkFVSWtXbzUwUXZtL1E0QmMxdDZnbXUzNVl1RWV3YkxGVDNOSmpPa2tKbUth?=
 =?utf-8?B?anhrdzJHYjZnbmtxL2svQmQyeFpiUEhsclNJL0krc2Z2MXFRNWUzSkk5MXdQ?=
 =?utf-8?B?T282VzR2MjNFQkdpeDNkd0lTRllWTXBEbzExbTM4c1djbGkyOFh0bmYyN1ZO?=
 =?utf-8?B?RkZ0UkdzUElGejF3clBHS0JzRVp0NHZHZnJZcjVOTng1bFRaQmR4b1ZaVWFw?=
 =?utf-8?B?b1NLT2dSTjhkMEZYUngxMTIxRHFJcENVMzI3L3RUaVpKNm9Vd2RML3FmQ2J6?=
 =?utf-8?B?V1BmTm1MbVV3MEs0ekM0blRPYVBrRkhKTVNMVnZkMENPeEQ0SmRRZ2dsL0s4?=
 =?utf-8?B?SEdJekZXMDBSRXlCeXdDTnR0emNNSVcxT0s0cUpYM3psSXF2SDdpSlBKbTcv?=
 =?utf-8?B?TkhhalBDeWtreGxack1EMFNQREdXeDY5TVRIL3NvbDFXcFVVWnBpc29BZU13?=
 =?utf-8?B?eGZlQWZWbGtsQThVWGRETkxlekFWNXlINi9JaVQyQmFxUGcrYVFsMDE0QWg3?=
 =?utf-8?B?Y3lNVlhVaTRMaDhLSHNDSDVkZlRYWjlBNHI2Ujg4TjZJSVpmdTNud2IwdTVq?=
 =?utf-8?B?TlZObzJGbmpWeDFRa2J6NHpkY3haL0dGNnBrOW54bjFQeXFLdHpTUU1BYjR0?=
 =?utf-8?B?c0ZwU2JCeXdkOW41ZHMyQk0xdGVXeWM5ekdFcUlBL2c3STM4cW9uSW5mYVg4?=
 =?utf-8?B?bnBuNEQ0ckpQK2N4aTUwODM4TkIwVDYrWWpGdy9sVzUyTHFKRGRkSDZUM2Fp?=
 =?utf-8?B?QzJSZ3F0K3laSWl0S2l2emk0ZGJBQWhjSmJUcTdqcG5SYjFwU2UwUHU2WFlJ?=
 =?utf-8?B?M3lualc3bmNtOGYzbzZueDV2NU8xeEZNTDJiNDZZS0swOXJ1a3AwOUJ3Ritq?=
 =?utf-8?B?Q0hRRy93c205YmMrMjN4U0M5NjhaUm5NOVF1QVZzMXlwU09HZ0Yyd0NaN095?=
 =?utf-8?B?c2JRRWRDbTN5b0N3bmhrcmdKOWxYWlNuWXcyVHIwU1p1UTR0VjdMK2JSdklu?=
 =?utf-8?B?QkpPYi95VWhTRHBGYU9ZdWZGTDdkZGF0dTJWVkZJSW9aTnF2ZEVHVGJMMDVq?=
 =?utf-8?B?MUJrc2JmcFJITXNlZ0lUMFBXYy8rcHc3TzMwK2ZkUEZuRXlOek5CQUF3NWh5?=
 =?utf-8?B?YUUyK01mNkNCMVZGczVibXRVbElyalF2dHpIek4zVGJBYlM2VkhhcHFnK0V1?=
 =?utf-8?B?dzVRODIyZVJXS1FWdnJZZEY5QXliSi9xanlPQXE4bFF6b3dWbnlhZzUrRHdT?=
 =?utf-8?B?VmJMNUREbWJhWUh3em5mSnRRbEpVNmRLclhzaS80SnNjRTg4dGd2TU13dVpW?=
 =?utf-8?B?dTJ1bFlMM2V3WVFzVHN0Z0YxY1BEWnp0bEpCQ0UvRGN3YTQ2M0svNVBJUTA3?=
 =?utf-8?B?ZjZqVUlMd1B1cDY2MVRqcHZsSmhEckthU3BvUHpBd29FMXhaNkkyalJ4b1Q1?=
 =?utf-8?B?V2hveUUvc2pZUXpUeUdOR1poZlUwbzNaRXZyV0VHa3NCNlIwcXJ0V1lXd1BP?=
 =?utf-8?Q?CX+80NGhFNcS68esihBVHnDmWuY3stwNkl8k1?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ef58095e-3e19-4edc-3c05-08de5dcdb6d9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:58:45.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fUHl9bGmanxVKri4NmJgT/DiaJp67uXq28HzVlDqnvXHh8yjbwM0gBBHMO1KfCICjfTnz2/1UEKrCmJNH5frpvhlhzSGJQmtQZ/v6tJ7lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9802
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 17:59:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8747

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/overview-manual/concepts.rst | 74 ++++++++----------------------
>   1 file changed, 20 insertions(+), 54 deletions(-)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 9ca188960..757ea05cb 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -211,62 +211,28 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
>   BitBake needs some basic configuration files in order to complete a
>   build. These files are ``*.conf`` files. The minimally necessary ones
>   reside as example files in the ``build/conf`` directory of the

s;build/;;

as conf is a directory of :term:`Build Directory`

> -:term:`Source Directory`. For simplicity,
> -this section refers to the Source Directory as the "Poky Directory."
> +:term:`Build Directory`.
>   
> -When you clone the :term:`Poky` Git repository
> -or you download and unpack a Yocto Project release, you can set up the
> -Source Directory to be named anything you want. For this discussion, the
> -cloned repository uses the default name ``poky``.
> +When you :ref:`initialize the build environment <dev-manual/start:Initializing
> +the Build Environment>`, you can set up the :term:`Source Directory` to be named
> +anything you want.
>   

Oof, I don't think that's true. Spaces probably aren't supported for 
example, I vaguely remember some bug report.

Maybe something a bit less extreme like

you can specify which directory will be the :term:`Source Directory`.

> -.. note::
> -
> -   The Poky repository is primarily an aggregation of existing
> -   repositories. It is not a canonical upstream source.
> -
> -The ``meta-poky`` layer inside Poky contains a ``conf`` directory that
> -has example configuration files. These example files are used as a basis
> -for creating actual configuration files when you source
> -:ref:`structure-core-script`, which is the
> -build environment script.
> -
> -Sourcing the build environment script creates a :term:`Build Directory`
> +Setting up the build environment creates a :term:`Build Directory`
>   if one does not already exist. BitBake uses the :term:`Build Directory`
>   for all its work during builds. The Build Directory has a ``conf`` directory
>   that contains default versions of your ``local.conf`` and ``bblayers.conf``
> -configuration files. These default configuration files are created only
> -if versions do not already exist in the :term:`Build Directory` at the time you
> -source the build environment setup script.
> -
> -Because the Poky repository is fundamentally an aggregation of existing
> -repositories, some users might be familiar with running the
> -:ref:`structure-core-script` script in the context of separate
> -:term:`OpenEmbedded-Core (OE-Core)` and BitBake
> -repositories rather than a single Poky repository. This discussion
> -assumes the script is executed from within a cloned or unpacked version
> -of Poky.
> -
> -Depending on where the script is sourced, different sub-scripts are
> -called to set up the :term:`Build Directory` (Yocto or OpenEmbedded).
> -Specifically, the script ``scripts/oe-setup-builddir`` inside the poky
> -directory sets up the :term:`Build Directory` and seeds the directory (if
> -necessary) with configuration files appropriate for the Yocto Project
> -development environment.
> -
> -.. note::
> +configuration files. These default :term:`configuration files <Configuration
> +File>` are created only if versions do not already exist in the :term:`Build

Reported on v1:

s/versions/they/?

> +Directory` at the time you source the build environment setup script.
>   
> -   The
> -   ``scripts/oe-setup-builddir``
> -   script uses the
> -   ``$TEMPLATECONF``
> -   variable to determine which sample configuration files to locate.
> +:term:`Configuration files <Configuration File>` provide many basic variables
> +that define a build environment.  To see a list of possible variables to

Reported on v1:

s/see/show/ to avoid using "see" twice in the same sentence.

s/  / /

> +configure from :term:`configuration files <Configuration File>`, see the
> +:yocto_git:`local.conf.sample
> +</meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample>` in the
> +``meta-poky`` layer:
>   
> -The ``local.conf`` file provides many basic variables that define a
> -build environment. Here is a list of a few. To see the default
> -configurations in a ``local.conf`` file created by the build environment
> -script, see the
> -:yocto_git:`local.conf.sample </poky/tree/meta-poky/conf/templates/default/local.conf.sample>`
> -in the ``meta-poky`` layer:
> +Here is a list of a few:
>   

Reported on v1:

s/a list of a few/a non-exhaustive list/ ?

Cheers,
Quentin

