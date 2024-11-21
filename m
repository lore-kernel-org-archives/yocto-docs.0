Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5645AD6ED30
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:35:43 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.51])
 by mx.groups.io with SMTP id smtpd.web11.10691.1732196141669385666
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RkIYRDPe;
 spf=pass (domain: cherry.de, ip: 40.107.104.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2GoqOpm2oJ9mEiITBRqXEcn0z22cU9px66RZ7DMgXuggDPjskc6PvnHY6d7v7nN30hFGHV4Uf21ROJkiLUppNfELiClrGwdm5qr22tw9pG0iIheOKGH/S5fWGLCbcfT2VmNeVfLAdFg2gDo11TT53cqEfeemgiw3SjG4ivzw6HkB2lElxwedcklu9z/GygCRhYU974lDHtEKgtczeS+2PjmGmUyXqR7VJjMppxoE+wzzpxxAiUdemOSqttt3fmya/IL6IK7Liq3s9nZuesE8IUyVZ2Zy0kK++eXVlFCsJohLQ6Dz3MqRH6toxHtSzjgIA8uINvpAG5Hobs4RHt+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtUwDb0rf4ZtZYTBqxHOnplBIfVzgJGjTC+YC2nJLyQ=;
 b=tjGby0nD6UqnaFHPoJiV2xc2qgnrtqFD//x3w6AtxDLtOo0h97lnbC6kakszICU+Fx7VRoXti/sjGDrCgl3X/BtURj3iscBoBpwd/hCvSGF6AV+ZjrC0GBrktNm7p5fuqXQnHYAyHsx92LTF8V1urWGxv02n48ghcNHEHZTEWVISat6x9T/69b5M+zK+zSkr/CbZpilcvu1Kc9gPv+DUK/jS/J2btxKSNlpmQS+R5v3WsEgLjom0UaqOIe0x1AN46YJKdYQwoYz323hNcf0IggxMUBS9znQ5/4sF8Sabff6wkOlAsVoEGaPf9qW7P+e59eWWaVBChj4GWaT+erfTKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtUwDb0rf4ZtZYTBqxHOnplBIfVzgJGjTC+YC2nJLyQ=;
 b=RkIYRDPeiBKfPuJ9w3zrY/PsbtQu8IPg1j28/ck3A79tnoHiS5Mr0esvZWnSDO4FTq0pHI7Kag6MTODFDlI5EH67I1eV+PRVzc4ylTiDpCVCCWEPxXuOpdeS0/OdZ7BaqaepMolbbRr5OVtveqTAz0AdS99VgxaH6zVe6kL9SUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7535.eurprd04.prod.outlook.com (2603:10a6:102:e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 13:35:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 13:35:37 +0000
Message-ID: <9ba00f48-b75f-4119-a298-ac044cb239f7@cherry.de>
Date: Thu, 21 Nov 2024 14:35:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/3] ref-manual: document ZSTD_COMPRESSION_LEVEL
To: alex.kanavin@gmail.com, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241121133025.1064006-1-alex@linutronix.de>
 <20241121133025.1064006-2-alex@linutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241121133025.1064006-2-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce68ce3-35f8-4224-6e5b-08dd0a316259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2N5NS8zWFlaUU95a0trSHZqUXU4Nkp2TmpXYmwrRmxCWmdWWjczc2ZYSk8x?=
 =?utf-8?B?bC9BZklraHFrRFFGUFgvUWptU3BQc2t5S1pZNFo4THZxK3FWWFg2ckh6YStC?=
 =?utf-8?B?cnVtcFJmRWdoY1hCVnFzS3lvcXFVNnZueG9QZGh6Vng3cmZqQXlWeXdTNWVJ?=
 =?utf-8?B?cytNRUY5Q1d0cjJ3NEdub0ZsK001VGNhS2ZkVzM4c1IyeWlnSSs3OEQrY0Ns?=
 =?utf-8?B?ditTa2FRWDA2eUNaZDZwNWdKTGtUNzU2SjlhS0JYR3dXS1JpZlB4SXpGbndP?=
 =?utf-8?B?NjRkT3N5TTBtT3ZGM2xwSFdXUlQ1aG1TK3AzcldoRWZpNjVhV1FJV3dmaHBL?=
 =?utf-8?B?NDBDaUpKWFphSE4zaEdTYnNFMzRnTTFHRUowS1BHeXc4QmFDS1YyTW1GM0lY?=
 =?utf-8?B?VmRYckcrVWFTOGx0YVdJekR0TFZMRldONDhZVkIvTzY2dlYyOEpxNDlPZFpC?=
 =?utf-8?B?V3h2OUJlRnU4cnBGdmRjOXNrM1RYYzViOFN3alNMOUcwazNBSDd5Yy9aSHBh?=
 =?utf-8?B?V2c5c2VwQWUvaGRwNGVTM3pJTW91SzJVRUVZSitYekVlNWM3akRlOVBKZXda?=
 =?utf-8?B?YjM0c29oUjJjcjFaL01nT2JpZjltWXVMZVdtU1lhQmhBNlJ3RzJqS1NXRmhU?=
 =?utf-8?B?cmJFRXpwdyt1cDFnSWhLK3Jvc2lhTGZ2TEoxOS95bENKS092MVRqcUluSWNz?=
 =?utf-8?B?WURaaXhzclpHaWNpczliZC9DeS84VXAxVnJ5ZTI0cjFGeHhSS21YUzBxYmFr?=
 =?utf-8?B?V1lDaS80OFp6SUdlaWFreE5Fcm5HdUltZkJObXZKYjRYYktmazFWZUVtQ3I0?=
 =?utf-8?B?d2pRL041QnFsRXpUU1Bzd2hrL3d4aVBaS2J4M2VYTFgvaENrUmdJTkl4SFJ1?=
 =?utf-8?B?NDlrYnRIMFdDQ3M2RjJIMFdIc0x2bGRSWWJseW1EbTM1d2NHU3BZbHdZbzlW?=
 =?utf-8?B?cmRVN0NqQzBhMUM2SWIwbEtEam9aZWlVY3RKN0JWVTZsNkorbUYwVWt6aWtV?=
 =?utf-8?B?U1dmRzhXaWtrem1ROHE0VDNhalk3TUUva1FKNld6SU1RZU1adDlscGJvdEl6?=
 =?utf-8?B?dW56djg2Y09RQ2dRcXBmbTd5Y1Z5NEh3RVg0TTNvYkhGSW1HZDI1ZzhPdmJq?=
 =?utf-8?B?L2g2NlJacXB2ZHEyNFFSMzBiMjFpTmVadkNRbDlwVC9lZW9JZU4rTzhwZDEr?=
 =?utf-8?B?d0FOVzlNZW1VYzlNVTlrUlVEM1V2VkZERXdUQmtrRHFQSUg1bmlkNkE5NlY0?=
 =?utf-8?B?N0RreGhPaDkwaUlML05jTnNrbStwUldzcUpLT0JOM2xTZHJXcFZCRUdoMHp2?=
 =?utf-8?B?TDVTTnUxVnFrcHNaejh0aXpobWZKL2gvUjBsV21tN1QrWHdxbDMvU1pSbXU5?=
 =?utf-8?B?TEJ2ME1XS0xKOTQ0Tk5NaE1TWlBCOXNXUWdMdWJjQWplZVgzS040dk94cVlE?=
 =?utf-8?B?V3VXUE9xZWZIQXRIQ3RSQS9UKzVVT2c1RDI3YUlSVzRCTmJETVRrSUc2YTZO?=
 =?utf-8?B?T1RPM2tUazBSY0xlREMyMzJINkVnZXJVcFd3OTlwb3RyUlNEdFczVldzaFpp?=
 =?utf-8?B?QS9aUFNTaFV5VkdiWWdMTzlZZHRwVEVrcHVZUlh4aWtFMm5KeWZMc1ViaGVG?=
 =?utf-8?B?MnQ0Wnl1Y1B6blZQY2tpZHhLUUNndXQ4SWwvQXFjM3ljMDRqbHlnTCtIUkVq?=
 =?utf-8?B?ZExoTjB3Y1A1L1dmYy9jVmQ2VjJ1TENuYTFXYml1b3lzY3lMYW5JcHFhV0p3?=
 =?utf-8?Q?uYWAfQJu8c5U92stQw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTVGYVFHQlpGdXFZeHBLQXh3QWdsakwvMVlzOHN5NDR5Y24zYXZIL0ZrK0ho?=
 =?utf-8?B?cDVYelpyOHAySXYrUi9zOWRITkNCNXV6Q3doQVBKZ094aU9Nck9BWHBCSWRI?=
 =?utf-8?B?aGpGeGxoMlEwbGxsTHZYZ3piT1hjYVBuNjhRR2xUSjd3Y0t4TUdGV2VLcFc3?=
 =?utf-8?B?c3pDTkZqMEx3azdLWGlGMFZxanJtNVVQM0s0eEtjcDlzSmxzUHo2YmVRbEkz?=
 =?utf-8?B?OFFWQUVmdHpVcWozOVRYd1VoaUZ3aXluV1RUYWE5SnIyZ2hZcUhzVDBBUjNX?=
 =?utf-8?B?RC9MNHhmdWNuTjVGVWFQRWw5T0w0ZDdJYnhYT3B3ajFITFFpUTU2WFJWb0ww?=
 =?utf-8?B?SW1JOG9sblZBdHJUK0lVblpOb2ttM2hrMWRZS2g0OUp1cGc4d1RZd1lROFk3?=
 =?utf-8?B?VHB1T2xsWXJ0dGRCUU9tTWwvV0tncnBUOWpvUDR5NXhka2JaeWNrRXBPMzlG?=
 =?utf-8?B?OEloZ2xiY1o4cjVMaXNnWkR3aHhDRG5hYnJCWkVtMTJ4ekowaC9Yd1AzSERQ?=
 =?utf-8?B?QnNTeVloZFFYSWY4M3c2Rmw5NXJDcWxYVUNlNlk3Z2VoeTc1REo5M3lYSkNV?=
 =?utf-8?B?d243ZlEvc0M2UVNwN3ZEYmdIZTNvcm50N0ZSZmVlK21oUEtuTGxIc05RN3V2?=
 =?utf-8?B?RlJJK1Q0UlYrbXpxcEJmWVg1T3hlMndZVGgrclp0bmdhbDJFTExYWFhHcmJh?=
 =?utf-8?B?THo5QS9sNnJrWi8xQ1lxTTUzVnpIVWQ5ekJlZFFKUGw1MmVWRkY5V21WQWlI?=
 =?utf-8?B?OFFZdXQ2L21xN1JHdU12U0lCN3dhKzBZTEcrVFpMeGRzVkNOYllUNVA4QTdJ?=
 =?utf-8?B?RkxmYldJMDM5eVR4UE1sdnBpbzA3SUhXRUpzZlYxRW1ITU5nVHlsdk1WY0hn?=
 =?utf-8?B?QktVd0djbnNJUnlWZkI0WHoxMklWN29VS3ZjeDV2SVBqK2tyNkVmUjA4RFg4?=
 =?utf-8?B?eVpzbWxEeHVCTlBDaytVMWJ6VGJ4UC9RUTY2eFM4ajZwSU5Vc3JZdWFCWUVl?=
 =?utf-8?B?WTVyeVBSbndPME9HQ0Z3NWE4ck5qRGJlaGJrYW1TUUpheHZ2OU5XSG5CZVJ4?=
 =?utf-8?B?dnFXSjhTZW1Odjc2OGIveUhxZThmb3plcExDYUo1NEZsa1ZIVkQ0NUsweFJK?=
 =?utf-8?B?ZXMzN0lHeHBUdGJyOHNTZDN1aVBXOE1XSVE5WXV1Wm1lOXNCSTBJRC9FbDhl?=
 =?utf-8?B?K0pldnd4N0p6ZzhpVEVsUHNldGZudjBrbWNXMWFpdDdKa2dEV2wyYTgxZk85?=
 =?utf-8?B?ZHU2M1Rmc0dyTUcxM1k5bVBpSUI0VnM5dElNbEJ1MzNNeVV0WFY3dFVNU2ll?=
 =?utf-8?B?L0wwZThJYkUwempNOUZQSXZ4YUpUY3ErSW16Y1B6YXc1Wldja0hEeDFmN2FP?=
 =?utf-8?B?QnpRQk1BbnVtQ1prMEVYR29vWjJqcGYwcWpSVW01Nmphb2x0b2VSWTNQM0ln?=
 =?utf-8?B?WWdPOGR5VzhFRWladnVQUUdkMVIyWng2MFhsZWt2WVpxZ0NUYzl3NkVLTksv?=
 =?utf-8?B?cmlwUEJqbVRvbmlmQm10MEtGVGRtTkNRM0RQWnRJL1cxb2FzKzE5Vm9EVE9v?=
 =?utf-8?B?N05KclFEcU1FSldVZW9ycFF2YWo0eDlyak5WRENzTTlITFJoTmg0RDF1OHl0?=
 =?utf-8?B?MUdoZUlxcC9Fc2FpazE5c1ZmOXdNdTE1TDA0MXR6Zml3QVlKdnB4SXgvRXNF?=
 =?utf-8?B?cVgvOWVIYVorZWJFMUNRbG5LT1B2TWkvS2Z2eldYOEtiS2RzbWp5elBSUVJM?=
 =?utf-8?B?aVpnYkM0eHljeVlKY0Jka0tLcjVuMTlHd1JoQ0dvMHM2MlN5SDdtc0FpbWlO?=
 =?utf-8?B?ZWVHa3o1dytmbkNZV3kwc0owS3JYdHd0MUJpSW9ndWNNWTlzeUh3dlBtcW9O?=
 =?utf-8?B?M0ttSjd4dTAwQTZCTjJpRFhVYnMwc2dzZ1Fmcyt4Vmg0clNwNU43SGdaQ0RH?=
 =?utf-8?B?NlVXRmt1dGo4UC9GaVB5Tkx6bmc0a2xXTmhxa3BLTEg3cmovYnJOcmRBNTJw?=
 =?utf-8?B?dFlMbi9rVVZEUERYV09hWEcyZXpyTGdxUjR3L1psSVlKY0tQY241Y29oVXps?=
 =?utf-8?B?cmd3bG5haGNudktEOHVkaHB4TU90NllrMGI3M0pSRVRKSjZPbVBLbHBzOFJs?=
 =?utf-8?B?aW5ucUQvbkJJamR5V1JvK3ZuQmVtbVdMbWlTY0ZxRjZNMkNQRUlMV3RXZlMz?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce68ce3-35f8-4224-6e5b-08dd0a316259
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 13:35:37.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZcyw4eWcpfysV7cTQwVt7cfEofWSNvO3VdOtjibZn4hJeVI8SNC+VXdkfdSuY4dVjyToGU3O2717LHfoHqsGujjGUsVB+9l8IXlFVOM118=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7535
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:35:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5789

Hi Alex,

On 11/21/24 2:30 PM, Alexander Kanavin via lists.yoctoproject.org wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

