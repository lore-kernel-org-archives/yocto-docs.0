Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7A8D2069C
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:14:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.47])
 by mx.groups.io with SMTP id smtpd.web10.23930.1729088087168595755
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cnsLevMp;
 spf=pass (domain: cherry.de, ip: 40.107.21.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDU9rUgYHmkRUBCPLme6DL4hccYjJ5r6a7CyYyJKZ39s0IhW7mApFUVPCmuQn0II2L2jRTzyzrgWupjoSOeiO6rKg3WjRND+ee6eeABmMf76r3bLzsrgPE7QnHAat7g/TKau3mPx3S7KRYVNebliOLd/WbjaCUGm/6OBeWpxqtFh792eA4iq7P5AzQMLHLJnxb481sHwpU4KTj8IvS8zJIjVfDHR5WSjFuP72I5vFFLs8ozzXyGWWzZupP8OkX3PU3PjB98J6KFUCLN6K5jxnC6CRQWicijLnfAXTIroRfA4Ai/O2EkzNOOwARxgbqVzjh/cGijYZ62QaQoypBl9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/WoNDlDqA2HlJDRGer3TVYAnkrJGBR/4Jj3lzULpgM=;
 b=tqDvfHl7IiXI7Lw2H99G/A5AGTkTVdLGYyZiYtEkQ52VeByPYsNNIXJVRWw3S/M29q0DK1wB4Pa39x31S5KDaNbJAo24Kd4b9CuysNI4xsozfd4Ez28J1O2+5M5q3Q4caP6gmXU2hyFfsf7zBEJeVwe4aub/kZn6sNYlrmSET3RujxDmLG0Ufz0SrKiCyvwA3DTY+qIowmd1GaGhmrceWWfmn1sCSI+3iOeX+UHmjOPcvY+D0lT8GucXL/16JGidFfZYtbV9RoLreVB+y0t+DudXGMUKthnpIqGqcYeLkl+hriRVrJMiiDnUkOHMA6M8SYog6YSl6BrzMz3GbIDQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/WoNDlDqA2HlJDRGer3TVYAnkrJGBR/4Jj3lzULpgM=;
 b=cnsLevMpA46q7t0p9QLCLqYWzwJNFzKZn0t8KWv0XBhUdME1q5sPJvjPCOL3pnApGXjDAZ47ilij0647T9rzRvxd95FY4Twjtj0Ju2c9lqGmadeJMqRbB1qzdB3cDH03gSutD4orljG8Y9GwqsBBdBJCm+dWbpt/nyZV8H/m9Ic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8610.eurprd04.prod.outlook.com (2603:10a6:20b:425::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 14:14:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 14:14:43 +0000
Message-ID: <831f50e4-c561-4d14-bf31-8cd6a60c24ef@cherry.de>
Date: Wed, 16 Oct 2024 16:14:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 2/2] docs: Replace VOLATILE_TMP_DIR with
 FILESYSTEM_PERMS_TABLES
To: Niko Mauno <niko.mauno@vaisala.com>, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com
References: <20241016140940.3166992-1-niko.mauno@vaisala.com>
 <20241016140940.3166992-2-niko.mauno@vaisala.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016140940.3166992-2-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6c6d78-3ba1-4c79-96db-08dcedece1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SVd1R3lOU21Xb016VjVFVzFoaktiOUR1VFdDeUQ0U25wc2RxbmE0emRZeEZx?=
 =?utf-8?B?OTlkKzF2cGpmcytITmM5WEtmTEtpeXJJb0JVZEFvdU5ySm1Sb3NUL1lod3Mv?=
 =?utf-8?B?Z0ltT3VUeFF1STFKc1hzcFJZTzM0a3dERU15bzhXLzlodTB6MXNNeE15SCtj?=
 =?utf-8?B?Q3BISW9SaFNCNlNFTk5GYTNiWjJYcThiVnk3Y2FIV1BJV0YxZ2hsK2xaRm5I?=
 =?utf-8?B?Sks1SUFidlRhU00vT3ptdDdHZENNQlFBTW9RdTZjTUhLYndyQTFudENOZ3J2?=
 =?utf-8?B?bXVqeTdQVWZjTmJ2ekx1VllZL3JXaGpycWlKa0twVG1UckpGbktUaWVLTSt1?=
 =?utf-8?B?amNEcmxCVDNIUWd2UjZpeCtjcDkrdm1nMjFEVThkRGpXNlFhSXlucVBTMlJ4?=
 =?utf-8?B?SGw4ZkFhY3JUMWhRcmg3RGFmUlgrSWdrcFU3SWkxKzBCelpPYzVLb29GdERz?=
 =?utf-8?B?T2VYeU5rdG5NbXFyUWtUYUFTdG1sT0ZTR0crQkVjenVQTU5pV0ZOeDNnelJZ?=
 =?utf-8?B?QXN2Qy9xMkJnZVV2WU5KL0x2NkZZMEIzN3g0WTVVNDBTRE1NOVlaWVQxanlt?=
 =?utf-8?B?akpqUFRDeUkyMjRsREJlY1EwVlFvT3Y1NU50S0ZnekdpanBUaUxPbHJLSXha?=
 =?utf-8?B?U1ovZjU2ZzFVWDg2aGtDKzI2aXJENTI5VTFSZThuYzkwU29UY1FqT05EQWxS?=
 =?utf-8?B?WVkyMFVDakp1WmhDM3pxd0FJKzR2emJ4bDhFNmtOMmU4eTFYSGp0aFUwb3hn?=
 =?utf-8?B?TE5sYVM3bzVQay9qWCtjRXZheko5ZmhieXNSQjBuMFFlTFFmMjNOaUxYcC9u?=
 =?utf-8?B?WnkzZzhxcXlhT00zdU5tcUN4cU8wOWp1OVRwNUdlVExGK0FsUlNhNVdGNkZE?=
 =?utf-8?B?eU9rWm9GbERUZnpkYXRpMnd6T1p5UDRTV2lFWGJEZHFlazI4NmVWYURkakl5?=
 =?utf-8?B?VjdIRW93TVFDUzQrZmh6MGt1RHZicWNKbGJHWkgxcUVDaDJqZ2FvWGl5eEhG?=
 =?utf-8?B?cUZXSlFKVkszVmlDeGR5S3kzc3V5ekVkdmdsOUxGUHNxWFRyZkRXV2xHRTYw?=
 =?utf-8?B?eW9RQk8zUFl0TlZCSHdhVE9NcU00Rmk1emcxRGJLTFpPMzF6b0NkUUhmRDNs?=
 =?utf-8?B?ZlYzTDFqUTRsS0tNaDU2c2l2Q0lmdGlOQ2dnMTZWTEU5cEZYaXBsV1dTOXN5?=
 =?utf-8?B?NTNyeHRrbmpMRFIxN1N2dUpLM2RxVFRPdHJPaFNKbGw0N1hHVGEvcGE1dkg4?=
 =?utf-8?B?d1FsTW1QTUppUWpmN3lCZjI2ZG0wcmpRVHE5Ynloc3ZJMXlpWkZaUjd1Q3d3?=
 =?utf-8?B?ZDlHcnJuemtTTVgvbkxxeTRaUFB0cUhSL01Ed2M2Z0krSkZwd3k2bnhyVytq?=
 =?utf-8?B?dy9iTUw2aGRXSFgxZVQ3d0FTT0VWUVBRTnQwUHJValFuc2V4Z2JvQ2Z3WElY?=
 =?utf-8?B?d21kWVlDMVdPOW1jTVNmMFJnejVWY1VPNEx2L0U2dGJQQ0tzbzA4VUV1dzF5?=
 =?utf-8?B?M05lbkxNeEkxcndFamJDbmZRRFViejFUNnJlaDFldy93QWJNaUNjZGRvNWdB?=
 =?utf-8?B?ajBnT2wzeDltRUt0MmFmZW5TcnYrTXFvK1ppSld5TWxDQmM4aVpTVGNCZmpr?=
 =?utf-8?B?ZGk4bXhycW9SWDR0VDlpM1JZaTZMbUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WklIUHdSckJpalgwUHMvMGRzWVJ2UmlUaDhjOFppdkR2a21ieXdwTHJaNEpr?=
 =?utf-8?B?NVgrbVA4TTg4RVlLb2Fvbk1yM2NSSGFIY1I0Y2h6Q3VRY290OFc3QkI1OERU?=
 =?utf-8?B?OUxNbXNHQUZjcXpUQXloNkhHaGpqVlU5UDdPWDNMZmNKMFV0L1NRanFUMXdS?=
 =?utf-8?B?L01MQ1hCcW9CMjFZaVdGU0hYb0lOZ1J5QmQ0WEZaMTJnMUhmeWh0a2RiWlJW?=
 =?utf-8?B?V1JkQTVJRXZWL212Ymh2Y01vSDdIcVljcEdhbU5mVzlmbTE3dmw2L3ZqTDVm?=
 =?utf-8?B?Y3RaZjkyZEgyemNkdzNseVdubFI3aEliS0h6QWs2dTc1SjBDd1hGZm94c1BX?=
 =?utf-8?B?bTJTRnV2SUM4UEY2UEtNQmlHK3VoMDl3eXJKdWFFbURUSjZIbVBUbCtvZ2kz?=
 =?utf-8?B?eUVlOFVSZnNwdzkza0d4NHgxaklRWFdZbWJZcG9RNXJRNUducFoyZi85VCtn?=
 =?utf-8?B?cWk0c29nSHZjWnFDWlJYNG9wS2ZPRWVnVHkyNnNPRS82V0wweHNmVkIvNEVr?=
 =?utf-8?B?Tk5kOWdOZW5CdjNaY1VncUo3Y1JLdTFTazlaZFFhMmgvUlpERVFnaElUaHpL?=
 =?utf-8?B?bmYyanlnR3dOMmQ3Y3NnSHZZQTJuUlhiM3dTY3RLVkU2UXpOZU5qbjZiUDZB?=
 =?utf-8?B?cXlNcURZdFZ3cDY0UmxHNXU3akxpRGxWcWJ0RDFkNURrb1JKZVc3eE9DanhZ?=
 =?utf-8?B?WWkvMmp4anIxSjRGbjQxcEtORktOY3JRMUkzY0VWNUZnbG1UVzFVZzlISXBJ?=
 =?utf-8?B?L2Z2dTYxK1YzUDBMek0zaW5VUXJXbE9GMS9mQ1EvZVRtY3JJanlyNHVIVFFN?=
 =?utf-8?B?WVJpeENCbGZLbzdwbllJR21HR3RUMkpQODQzMjVJVE81VkRNZjBXSkI5N1RK?=
 =?utf-8?B?d2F6MTB3WjBwdS90TkFROGNUaElGcERjYTVZU05qM3VPdzNvNFRiOTFpTDJM?=
 =?utf-8?B?SHZlWjJ3OWhaMitmeEJ0UU1SUmZtd29LVVpyb0x1R0xPWER6bkduYU1kRUJG?=
 =?utf-8?B?UURCRng5YUxvQWZWKy96MUlPYWpCQWxJUUxienAzd3N5TWxTNjEwclVJZ09m?=
 =?utf-8?B?S1pXK3RDY3MrdTZsa1JVaDZNK2p3eVRlczB5ZzkrdURNakE5Z0VjZlZ1RHNV?=
 =?utf-8?B?YWtlbTR3NTdmZW1wS2pOTnpzQittOHZGaWpqMnBINDJORE8vZ05JdFBxQzRF?=
 =?utf-8?B?RHpWQzdrUzNEcVBNay9NWUVHYUErbng3UmV5NW1MK3doQzZ5Ymk2SlVFTkMx?=
 =?utf-8?B?N2F6R1NLcktjZUhkS1dHNm5Ud25lR2hweittOFBHRU1UTkZwNjNseEE5WXRu?=
 =?utf-8?B?ZEhWb0RPdUNpQkxMSTFCM3cxSEVHZldBSTgyZUxZbXp3clBMQmZ1NHZoR0xN?=
 =?utf-8?B?L2RmWVU0T29xaFk2akZqUldhV0JBdmppWnNtbGVRREo3OFlrZ01tSFQ4ZndU?=
 =?utf-8?B?UENtRFhWRm1aWS9wcWF4TVhzRkd1UjAvUVpyZEIzR05EKzhBMzlhVnlGNnJr?=
 =?utf-8?B?T1dHRVdHeTNjN1RUQ0V4MEU0d3daQXU4UDBNSHk3MmxtN0cyc2lxTWZ5cmhs?=
 =?utf-8?B?SytIMUx3VlBIaHZ6WGRHdCtpYUV4azNCT3RlbUJoZkg1OUxSUXE2WVUySm1C?=
 =?utf-8?B?SjhRSWdQVWwxQ1h0V2cyUWZXVWpma0JVbDkreFZySy9qTmtibTJtZXlvSVI1?=
 =?utf-8?B?dkZ6c1BVTmoyLzd4SHlaZU9HdXB0cnhMU2tBRDRnbWxUVzNSMXVUZXAybi94?=
 =?utf-8?B?WlBBdmhXQ09IV2x1OXd0QzhLSFhsWDRTR0ttc24rV2dBY0NRdE41NEx5Lzlq?=
 =?utf-8?B?dFFmWFpxeUpQOXdWaDIvbjgxak0zOS9FYk1RdE53K0p0bDBzdHZORU1EWjNZ?=
 =?utf-8?B?bE9RdzJSZG80MkRQdDRLT0hXdFVFTW1GNGxQeVE2d0NYbE9GL2xGYTlneGNQ?=
 =?utf-8?B?WHRSTlNzVkQ3aTJCcmZzWWp1T204YUU2QWxKbmxBTGF5Nm1zRWI2SEl2eVpX?=
 =?utf-8?B?NkJJeHE4THJFWGV2UmtET2M5eDc0WXNvYmUxTWJzTmRlQ3RCd3Y1emFjd2VJ?=
 =?utf-8?B?N1JHOWQ0K3pUTWNiVVlwR0tmZjhyMEErWHVWVW1zMzRRc0N5SjlqeGNhQnAx?=
 =?utf-8?B?R3dacVVhN0s0WktLcFo4emtzQkxvVFRsS0wydHdSODFkSlhpd2xwK3RZQ1Rv?=
 =?utf-8?Q?sPxmOuZwn63QZYT4DkbvnmE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6c6d78-3ba1-4c79-96db-08dcedece1e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 14:14:43.8626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbueZ5Dmg5gY4PzhsUiZR0NNeEm16g1OfMjK+WH56qgmTHiPuH1KqTm2RDX9C9S18gA+1v/g4y9XHWPYo2MHBdH8FSY3ls7AJ5m5yjJWehI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:14:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5517

Hi Niko,

On 10/16/24 4:09 PM, Niko Mauno wrote:
> The VOLATILE_TMP_DIR variable was removed and it's functionality
> replaced with a FILESYSTEM_PERMS_TABLES entry in
> https://git.yoctoproject.org/poky/commit/?id=2f46b6f27dfa3a9d5ad177900fcecfe64c3536f1
> ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead")
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!

@Antonin, candidate for styhead backport I believe.

Quentin

