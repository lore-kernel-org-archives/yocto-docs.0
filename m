Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941D1E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:34:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web11.78792.1734431651275311619
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Mhwn4rA1;
 spf=pass (domain: cherry.de, ip: 40.107.20.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSffKCTwROfFmxmIMWobPfMMiwFNQrcjGCaOn3iOg92kQvRnaouiJ+UFe/+Pd5mmrrz5Z+u1EasL59Z+d1/PTwyEubz2065vbGDalJqGqEUCe1jsazbMskS38eko8DBUFcCozjx6ox+Fm7j7v6b5c5tL0AlgyLGxp6o6xg1v7jg0AK3EpeXl6utj9vC17ySsAF+bYf9gq7JjfuYVuivjzPrLfcHByKqX4NPq7e1qER5gefQCr/mzqvwmFeSqUOAaviLzCIqUQRcSpKGVpT0mUeACWbrPptOckx2Ge2nz+jISn2+wnrYD87fB5bKpTDxSV7x/w9JCYk6k/jBq/HzY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJdhOhAv2gsc69Gt9XQIFllLw2hXTaVkZsGrti7tb5E=;
 b=VND86WC8MEN1ucyLKEfq/nkJI6YELS8EHsnJVZa9M0zlttjIgBw1Qycj2lL75XOWWAMwTnXAakK5mNVPjTodymfo/XJuB8x+qgo3Vikq4xxsRnphDpBGsF/9vsOmPmtLqWZV0ViEvfS8a63Zaqtwefp1TZAKtTd0Sezb3k4fceE2qeR3icQ0XJs0uTfk8huZpZmHCgf8qpdVjrWEtxx6262lNiQmojaWpEOxBtVWfF9vQeEBbgHmVy9bmDmhbzw//M8XNLHQ86Hj7MKifMHFiKsH8q7kDCoKtoGJlZNk3QxlIyrfqKF9s7aj33jjgdSBIIYRl94h92JSwPvrGVyo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJdhOhAv2gsc69Gt9XQIFllLw2hXTaVkZsGrti7tb5E=;
 b=Mhwn4rA1AeIOV8DER/sGN7oGw9G4s54JVhmE2zTzzwN7gRrWe9LukX8HyQtAnTorZ1ueIdASIk49QH9LyFXlWj+hJJFULy/BKFu/YAu/uBeHwxZNqcWljlaePWbcwsyUHLuM6kxgq5bBDctMJS9MpQFdBEicc53IhGVqbK40isU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9130.eurprd04.prod.outlook.com (2603:10a6:10:2f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 10:34:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 10:34:08 +0000
Message-ID: <9bc14f7b-fc24-4abb-9a4c-360f0a350234@cherry.de>
Date: Tue, 17 Dec 2024 11:34:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 04/14] ref-manual/variables: add missing
 entries to SDK_ARCHIVE_TYPE
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-4-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-4-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0418.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b706b29-73b3-4865-0650-08dd1e86565d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2pMTGpsa0NCQmNsdU5iMVNnMUdhZTgxSUZxRG1ja09uT3F3SEZxVytsbVhn?=
 =?utf-8?B?bGgyY2xOZ3UwZGdGcWhlMDJuL0puV1JDdXN6SFo1bXY2K0lSRVJvd2prMkF3?=
 =?utf-8?B?M2dST1d3QTE5alFHM3MwUnJqTkU5MnVUZkFVL1JLSHRZSkxEaFpKY3VOd04y?=
 =?utf-8?B?UWgxMXVsZWI1RE5tUWVOM3dBTVU5bEY2RDZPUnZRMEN1R3E1QWhNamFrN2h5?=
 =?utf-8?B?enRkYUgydnhQZ1NQaUdyS25HS1RoOTQ0eDdIUnR1NjZYN1JKNWZFVXlqRWVs?=
 =?utf-8?B?S3FCUmIxQ1RDaFRYbXZQSHRLQjBra1pFTlhBSGVzUXJOSDNOTjROUEs1ek43?=
 =?utf-8?B?cWFueWNQNG5zWmVxYVNEQVg0RlJMVm5rZzJYeFRIcm1KRUQ5V04vVHZjRFRS?=
 =?utf-8?B?TWx5Q2trMVloNThGUXZzZDZ5Qy9YaUJsSWVlSFJIUzFRRGxsdkphRnFMNWN6?=
 =?utf-8?B?TXZzRFlsQlBKN2dXUUFSaFd2N0J3MFN5MnNQN2Fhd3Zha0ExVmJ2eUdNbnMr?=
 =?utf-8?B?VXNxb3VhOWYxdDFHYzA5dFpiakJjVlYxVE51dEJaQStCMDBzWEk2K0JqWmdl?=
 =?utf-8?B?S2tVUkNMUE9waDd6bG9JVVcvOCtuYVE1ajZIbktQSUxhWEIwcDljVEhLb0Rn?=
 =?utf-8?B?QTJsUjFYeFVRTnUyREpiQ0gvSlNNOHZ3WWljVXNsL01CK3JPdTUzSGlwREpX?=
 =?utf-8?B?VE11UFNBdDhjNUpNUzV4R0h5ajdlMEJNZkduMWpQbDdPV2l3MEFHZlkvcHE3?=
 =?utf-8?B?M3drNnpxbm5lUFE5V3JkM3BaREJ2N3VvUHI5U1JHajFVTlQwcEhkQUpId0wx?=
 =?utf-8?B?MC9rTEh5T3RSY0NwQ3Z0Rmc4akZCY2FiMEpRT014RjNBendNL1dCTkI5MGNG?=
 =?utf-8?B?VGRrTUtUbWlzVDVKN2N2QWxTb01za1pYNG55ZndEMG5wYzdvR3ZaYVF5WVA5?=
 =?utf-8?B?Q0Q3OVFrVnFFUkZLVVlrd1JyQVJDUml2aU9JUTFjSzJON2x5UUJKTFpabVpa?=
 =?utf-8?B?cnhnbG52bkFQa1kxOEhWTzVleXdXTSs3YWEvUm9vZHJCUnlZY2pBY3YydGFL?=
 =?utf-8?B?UGEybldzdlg5YUluQkRsWkRINkdka0pwSUlyd1hQWExhZUVGUEhzTHYvSEVz?=
 =?utf-8?B?WmNQbE8xcThOSHZTSnNqUitRbWNwdElmSVdrR0xDVHkrSjcreEd5VFV1ZGZ0?=
 =?utf-8?B?MG54UUgyT2ZkekdKTkR1WmViQlY3Y2ljbWwxWktuOFkzT3lYQ2JTMWJPMGth?=
 =?utf-8?B?SU9QWmdjUmJ5QzMrOTFOSCtwWDJTb1VYZEdjYjFkdGsrVVlYWkM4ZzNCYnZv?=
 =?utf-8?B?SjJPSkVuNG1sSWttV2M5a29qTUIxTklvcVB0aVlvT3ptT25WME8vdTV4SzNa?=
 =?utf-8?B?N2ZFdjBlNmVMRm16OW82WENCVm90R3dWQXRJVWVaalRDeFFGTUgzNHhMMG9C?=
 =?utf-8?B?K1B4emxmZHJ5SGk4QmlMNUNKZ3dxeWNjamo2bjJycHNDUy95WUh4dnRlTkU4?=
 =?utf-8?B?TG1Nc1ZST3RmNTkwSU9weXpQdWIyRW1xUCtMQmc2SXNKQmtuSFpjUFFac0dt?=
 =?utf-8?B?eFhZOEZLNFlxdmQ3cWYwY0c2VVV6Sng2TGJaNVhaLzZYRzNtdFMxSXc4a3kr?=
 =?utf-8?B?YjZ6RmZWSHM4MXlzN05OZVRQc3VNMDRha1dCTGdGbTcxVEF6YVgva1dNOGVN?=
 =?utf-8?B?ejNwaU1uY1VnYXBWNld5UzlreVYwbGFVa2FxV2tXU0hjUmhzc3cwdFB2UVlB?=
 =?utf-8?B?ZVhVZjVlN1Z4NHZyMjlPZDc1aXUwS04xZnliWXEyM0NzUlBGQVE0ZFJWaCtn?=
 =?utf-8?B?V2dQNHBNdTBpNjV1RkovdFlaL2JKOEZCYXhmRG1SOXU4K0pkOGt6VmlqUVZL?=
 =?utf-8?Q?05/JJFuM4Bcjk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Yms5VFZzY2dXaE05VFQzMVVKd2x5cUNHVllxMDF5KzNxMlNBcGdHY0tYQWlD?=
 =?utf-8?B?T1dqTUpab01PYkN5TktiUUlCVnFIWDRBbnIvN3JPN3BTV0l5amlGV0Zpd0xR?=
 =?utf-8?B?MytGTlRJcGN2UFRFangyeG54T0VyY0pVWVlUUFZjVzRGNlV6RVh6angzS1lt?=
 =?utf-8?B?MVhZcVpHTDlrWGkzcnI1WEg1bFZFQ25XeG1yYVZTZ2FoZGtrY2o4b3JOcnN6?=
 =?utf-8?B?aUpzdlcyaFp3cStmdU82UC8xcGZGcnljbXVldjg2WjMxVUhHMW81MldnWjFB?=
 =?utf-8?B?TTJvY2pOQ3FkRTlnYU9rQzk5UFQwQ0dvVFlDZGc2b3g4WUd0TVo0NlFIaXkw?=
 =?utf-8?B?ZElZbGRQK2U4MVRESmEzU2xhWWozWjBXa01McTk4MlcvNEZManFneGhQN044?=
 =?utf-8?B?QXdxdFB2T2JGRWNlTUlEM1JYVnVOWkU1dnFZcnF1YUFUMEIyZktWS0pyTG1t?=
 =?utf-8?B?MURtamlYc1pHM21KTU9NVm1JMTQ2MG45N3hEOGVqTnhka0ZTOUdyK2wwS05S?=
 =?utf-8?B?VUVDNzVZN1VyRGJrdG45eVQwaG45UnJrUElSeTBpVWswUzF5UkQ4RjRMcmg1?=
 =?utf-8?B?VVpFUlY0RU9kZCtnTVNVeTdnMlQwSTJIQkwvZmx5OWZIbURqaElIMmRkUS9F?=
 =?utf-8?B?bTJRcWFIcVdyQXB5UXkzS3JpU1psOGRURU1WMjVHdkVDTFFWd2N6MHhlNThp?=
 =?utf-8?B?MnhKMThlMkRweFpqWDNsN3B6ZCt1R3pMRUJiVHBQMFRaTSt4OXZ2VlloalZB?=
 =?utf-8?B?Wk5CaE9NWWZvQWs2TFN3aVVPWXVrR054QUZHeWRhRndERW1MRHI2SHNSaDdo?=
 =?utf-8?B?blZ4T1ovNHFoNUJNS2x4cXFvdmJFMTlGZCtrL3pTbUFGMVJGQnVSSzk4OXBF?=
 =?utf-8?B?alF6SWxTNzVPdERBNU1ESElxRldrMnhUbEVyeTdGL2N3RHNkS0xwVGJyQ3NS?=
 =?utf-8?B?QmxTWm0xUWpEMk5GM2NmNVZrRVF3SjRrYkpEUEd5MExSOU4rZVZWa1huWkxm?=
 =?utf-8?B?U1NiN0o1NUtaMEVIeGhzR0VUWm5Pd0NYRFZ0SXRUZ0ZXWXFTTng0ME1NT3BE?=
 =?utf-8?B?VVEycWF3VEh6WjlISUpoUDdaT1lyR24xaERrMzJIelg0ejRWUmd4WHA2L1Qv?=
 =?utf-8?B?andoeXZlU3RKQWE5U0RYektzYVY5L0c2ZWxjakk0OS83UkhKMXAzUjlxVU5P?=
 =?utf-8?B?WlF0RVY0d1BZN0RMOGllT0R2bHZQNWZSTm9RajRTUFBQMUJmUWpwZVdrcVZt?=
 =?utf-8?B?Y1NhR0NEejNCLzFUMzFyZlA2a0JzbHF3VkpXRWJmNVdGVXVaUm5MTXJDaVFR?=
 =?utf-8?B?QlM3RTlPNjZIU0NWM0kveGY5c1ZwWURDTDcyK1V6clRjemlOY2sxZDc1NkV5?=
 =?utf-8?B?NS83QUkxc3EyT3BiTkdHWlNsTUpKVmI3QVhrbEQvekFPV2E0RHdIL1lmdFBN?=
 =?utf-8?B?Z0lFK2h3c1pQWjMxSlRkUHZyZzdzOG9XNEp4dURuSG4waGIwZjF0QXI0bzIx?=
 =?utf-8?B?SC9VUkRVSjFJYzBPVGxEdzNyeU1WWnQ1OXBOQ1NwRTUrRkNCUUhjdG9NR2dj?=
 =?utf-8?B?RUFiQ3p5Wm96NWxZa2lZRTk1RkFMeG5SR0t0TzFFR1NFSkg4SEVSL1pYVFBx?=
 =?utf-8?B?QlZvSFN2blB6M1Q5NXBTelE1YmI1UWJWd1k0aVlXRm5qbG5MclhvWnJPVXR6?=
 =?utf-8?B?QUlycXhwU2xqMlhHOUZVSzZvbi9RcTVDSXhPWStkMTZJcjh1ZzBrSFhFcVFs?=
 =?utf-8?B?Nm9mbXl1TmEvUFp5cXhLQk1VTVBhVHhxdWJNMUViWWVCUGdPNEdEbjVEM0l6?=
 =?utf-8?B?K2xRVEU4NkRFOWlhVVV0VnNDR09mNFVqVmRGeXQ4SkFQLzk4cURVR091WEZH?=
 =?utf-8?B?UFJlR04wbEhFcUY2VFVVaWZYWldTanFDZzEzZVdpOC90eDc0RHI5ZkxrdlRU?=
 =?utf-8?B?eGZ0U0JldVROZ1JueWxOSVVISGYvUDFvTXpuMzhRRE5Ja0hLM3U2bHdVc3hQ?=
 =?utf-8?B?TE5ydk9EM3FQbnlEZlhWcVpwZjhweWorRFE5NUNESFY3ZlJVUXViU0pVUTFo?=
 =?utf-8?B?M3dBekVXTUxURG1yRDhkbEdsQ3BkTWQ1N0ZxUzJUK2VDajhLcWhKcWYrbEhY?=
 =?utf-8?B?aXhOWFMvR0dZbHphdWE4dVd3NnRLL204Mk1uVUZLY2laME5HYm01V2dobGsw?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b706b29-73b3-4865-0650-08dd1e86565d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:34:08.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OlZX3IpGxY2na8UfUGNJmgxyH8jmP+2nxWTjl2BqkIpkoK5m14BEMrVkNDEne6S5Ux+UmM+mULCg1MhiJiShsy9RRSe/slTkRenilYtnnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9130
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:34:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5955

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Both added recently in oecore.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

