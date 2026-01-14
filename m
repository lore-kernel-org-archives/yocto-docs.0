Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915F4D38FE9
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:32:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14437.1768408326390077572
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 08:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aT1sf0hL;
 spf=pass (domain: cherry.de, ip: 52.101.72.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnuIyu48VE+Z0BNHtp7e5UjSVcA2cIPSJzQQ0lYjbXDZFFXh8C88KRTHmc7AIOrH/H3URDzMiyC8U6KqFwASSKYY79f2kRd8zFM6t7KP63wpzx8QsPr5hSNTYmKbnnHpO1I387qQXKLwQmqTJnwCZKGfJxfWq4pYv69U2PNKdAnQzHvChXFpRGuzzpFgLW1g5WImQ20J+w7722Y2vC1GEGNQ5Gr2YV6nLfodDhqwpE0rMF0j1eomYINIdortT1QTwV2KXKT0gUAVc56Fkuhq9PcNmFA7IFPotRlXTK3Q7zOfz6PF3GOhgkryoXE9FzJSo+LXkL8swOmjMQO38mYkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GScCGQWDk95KaOlgxzCD1r1/koH7tMjQseOmQRkc5gY=;
 b=x5ffvVWpPh4tOn72yxLZ1qUtk4n42/qv4OOEv4MN3Ni5ghJEypQp3TtI8JIZrKg8h6Q7EdGL8WtvhtyBxc1Kj97ASicQC+boU+IFoEt2kmoXuuvVaNoSvTH+LOZxydMDYvcWExoGiK1Y4W8wag923M0EAaKe7zlQTEpPnDYHayeEKlzPhNUkyeVrjYiOPnRyMN/qi96UpsbVZx5ygHzHmcN4B0YjK7qxKXd4Ckk3DZAfQKO70nHnXne5udChoyau1aBC5SHZGpU8DiHGds97AyNHOm+JM6goEMPmYlVdPPEZRedVCdtfzeLxl2STJYUrNJZf24Uoov3hcTOhTGsheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GScCGQWDk95KaOlgxzCD1r1/koH7tMjQseOmQRkc5gY=;
 b=aT1sf0hLZ/HwVZsYQVRq6awYOtqBXxu6guSyGyDN9Cn1aD9C27F/vcN1jWRVjc11nGxfvTe5agLINrT8sZFkwfojUZukTMsxn98e4iVLwXXWAVoWP5NuHxDLiOs9fa1BKEiBwZDgypcJ7kIMX0Njr9HjhR/LiPYZWORF+AMwDCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10930.eurprd04.prod.outlook.com (2603:10a6:800:273::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 16:32:01 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 16:32:01 +0000
Message-ID: <ca72809b-8660-4028-8eb5-39ce00340d58@cherry.de>
Date: Wed, 14 Jan 2026 17:32:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] bitbake user manual oddly does not introduce
 "bitbake-getvar" anywhere
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <61953ee3-7cb7-7b00-7d16-3faacc5d4058@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <61953ee3-7cb7-7b00-7d16-3faacc5d4058@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10930:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f70666-6c8b-48cd-4a12-08de538a719b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TWxmdTJ4YTNBQmFaRjJVNlpwa0srOWxrRXlTVnJ3L2tiakxnZ3BtRlRGMTlY?=
 =?utf-8?B?YUQwYkxweG1qaFBXblNKVkFycDVhN2EvcEhrdS9VUFcrWlREaWh5YVVJYkFn?=
 =?utf-8?B?VXpOUTU0dkpRZ3luVzJuUkl3NkZBejhnNGxKOGVjbGZGZEFxS1BRcThHTy81?=
 =?utf-8?B?MnNQVDNRb1IrWGV3V1ptbEN5UUozQ1ZpZlJqZDhXbktXU3JOcklKK01qamxD?=
 =?utf-8?B?SnBMekRCcHFBVkw4cG0raUZlbjlndkZnWHo4VWo5Vk1EQzRSZDFPVDExNTFP?=
 =?utf-8?B?azhsby9nUFdkMjYwWHgvUjFyeDhieDZOOFBBQ3NYQVEwbDE1bmFPa1JoVit0?=
 =?utf-8?B?aEVvU2ptSG9oVWI4TzNSRXJyeHRPVGk3eWhyYU85aC9Cc3ZyUVMvSUx6bFAv?=
 =?utf-8?B?NklTdVl2UWtMRXdVVXptYVorcUkyUkc4aERMSll5emFidXFIb0VYdlBmU1VK?=
 =?utf-8?B?eTRPb0t1a2NkQlNiTE1zaGl2dzk4WHVTWGgwM3BHaG9FVU9qaVJ2VG5qYy95?=
 =?utf-8?B?Z0RCS1N6bkY4alpTTVdUN1RPbnVUcGtlblprNi9iUDJtcDlSSmFFQ1IvakFw?=
 =?utf-8?B?bGJYa3VEUk5QL3hDQzBXWk1rWGxVNDhWcm02b1ptSDhFWWhXWWNoc3Q2QWFH?=
 =?utf-8?B?aElVOEE4ZXVJc2RiQUlZZWhabVVCelNqRmo5RzZZMS9iR2xlNk5SYUplUi8y?=
 =?utf-8?B?NmZFbytyTnRTUUlUdFNHN25hQzErbXJvT0x0Nnd3emR2S0VpS1g0MFRzQnlV?=
 =?utf-8?B?ZjV5Smh6Ym85TEU0TnJVbnNoZzhCeTh1TkFwZ3dCcjNrQWluREcvak43Y3FG?=
 =?utf-8?B?Qmh5Q2ZlZ2lQdnNBdXZwUU5rUC8xem5WTG9qOXp3VHUwYjdyUzY1Wjhza2lC?=
 =?utf-8?B?aE9DYWxIcFI3d3NkVENYQkR4MFY1cmxVQmpOZ2Z4eENEZG1McXNLTS81SUd4?=
 =?utf-8?B?V0tZY3dEeGVrZytPdnNZdnpHYWtJSGdSY1RaSzZKOVZidThlQ2FtaEtaWGlx?=
 =?utf-8?B?cHdGMkZobW5SeERzeTZQdjNxUFlCVjd3YVYyWFhXVGUvcWJzUjAzbFVEbUpv?=
 =?utf-8?B?ZWFhMUgzNGtoRVFEQitlVEZwMFhrS3cxVm9NaEhEU0NITGlCeHFxdmlpTzc5?=
 =?utf-8?B?aklGOXBnQkJ3TE1PT0lld1l5Ymp3cWFUM21ON1lHSzVCeUVwcXZMNlNHZGsy?=
 =?utf-8?B?U0w1cUd2amo3YnREbW1SS0luS29YdWh4ZWpTemh1dWpzVGpLODhMSzVKS2xt?=
 =?utf-8?B?Zm9zREw3K3FwVDRrdjhNdHk5NzRKZEZWKzkzUHF1WGdXeHB4WFBqU29uK0pw?=
 =?utf-8?B?N2oyb0cxTFlGdHU2c21WUUtaL25aYlI2d2ZBajlEQ05DSC9NN2JEUWN5dFJE?=
 =?utf-8?B?OGxqSTYvZ0lUK3R0azNnQjR6Sm5PL0wxVk9OT25BN09JVi9PMjhSbk5Lbjl0?=
 =?utf-8?B?Y1NDeTNsMmN5d1FHbFdrK1YwY0JFa1Y1clBXRXM1Q3RGVUVVVjRROGxkc3dX?=
 =?utf-8?B?UGw5QlpCTERpR2diM0pEbUFQUUFkTGIwQklLVkRxZGkzayswRTB2U2pDZG9X?=
 =?utf-8?B?NU5vWmc0ajRCd0YxbHptNXVIWGVHVzlERGtYdnVEZkZ4VmhLOWxtWGhEaUpw?=
 =?utf-8?B?S2gzdU4vWjlMTk5Ba2ttcnNJTW9pMU1pZmJJRVNDK0Y0eElKdDZCbW1RZXV1?=
 =?utf-8?B?dlZVdXNUV2E4cDdQL3g5eW13K0I5RG9HbkZ3V1FCQ3htalQzOVJ0eWhlOTJP?=
 =?utf-8?B?Q2pWZHZUWGc2MnpvWDNYUkZlSTJQSVJmMWUvSStmdDRILzF3dVVGK3ZUVWhP?=
 =?utf-8?B?WmlxZTVmRUZGVys5akVxWGJ3alc3ZFVrNmlvNXU4b1ZJQ0lBTDBNK3pDNnFK?=
 =?utf-8?B?UjZjaGFmM0JOTEorS1Vmalo5cjVNZFBTUXZmY0FvRDc3NmhUNWxzVkt4U3RP?=
 =?utf-8?B?Ky9NTllVdXQ0Rmw0Y0ttSVR3UTBTSGx4d1FGRWJobXdNR0V3bXREUXFxZzNV?=
 =?utf-8?B?S1EwMHRkTmNSWmswRTJPdVVPNFpuUWxPQ1NrNGxYVXZUZDgwZlBMQlFNNUMy?=
 =?utf-8?B?MjBHcy8rOTJ2anBXWXhhWTNwSEs5aEV3VkhnNXliUWNRSUdpRnVmQktBZFVy?=
 =?utf-8?Q?Gpic=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVBZZzBVOXhZZ3kvOXFnUHkyTlc4UU9Zdkx6YUhXRjlWZHErVEdRcWVhNWFH?=
 =?utf-8?B?Y25FekZiWGM1T0V0TUs2VTJhV201bWMvTzNNWCtkSEVXRko4YkVIQnN1VWh3?=
 =?utf-8?B?SE42cWVRdkJhc2NjRnhtOW9tM0JyZ1Uwa1dtN2FYRFhuNDRWSVdNZ1dMbUk3?=
 =?utf-8?B?U1hLVDFZZ21OS3ZqU2gwbkF0cWE2TkpnTFpUWFFvUmhxTXZYcFVaUktpUG1y?=
 =?utf-8?B?c01EUUU4N1dEMHFkRXVDaE9DalVjQlJKeWwrNk5FZTVOVExHWlNmL0pCaHBp?=
 =?utf-8?B?aU15a1l5ZFMyL1NXZEd6aTllR0wrZVd0YU1uU3pJUFQ3N011SW5yM0NUUW5v?=
 =?utf-8?B?Y0p5TlllOXRtQXFaR2VrS3JLbjN6cjdQOEdlZnNWbFVhUkF5aUlCTVJld0xN?=
 =?utf-8?B?eGlRVFl5TFJheUtXSFNhM3J5VkhwdGpMcjNyVkhhUkRPNjNYcWcxNkpoR2JZ?=
 =?utf-8?B?TFoyZWUvdXpnOTg5TFJiajdUYjkzRkpkaCs4T0d4RGtVczVuRStmcWtxKzQ3?=
 =?utf-8?B?N0JMQTFRQ0FFamFVSmYyOE5HZ2ZUQUwyRmxvZjVDaXpqOERrNEhoeDNXa1h5?=
 =?utf-8?B?QkZac1FySEhlaFVMdHlJRkFZUnNBSUVIa29OQ0M0NlZTUU1aR0RLV2c5OHRB?=
 =?utf-8?B?Z1REY1Fzdko1dTBMTGlwUnA1aS95QzBaVkNSZzFhNHg3RWtBT1RYcmVVUG9z?=
 =?utf-8?B?KzNjWmhOR1M3WE5FMWU4TnErUDN5UjFBMjh2YnlXKzhSRGJlek9qaXhlbjFG?=
 =?utf-8?B?YXZPVjk0VTJpRXJHQzd5UW4yeTY0TzI1YktrOTZ2UkdvQ0hMc05KVXdiQi8r?=
 =?utf-8?B?ZTVkaXd3SlFHVzhhdndqQTFXc1JVdUpVUmUzV0luUVZJK3EydG5adTBXRmx2?=
 =?utf-8?B?djM5RUNaakN3RkhWbUxOb1RqeWw1d3UwQzcrSDJqQUw3VGFmdlpCbXRwNk9B?=
 =?utf-8?B?M1docjh2QVlISmtiazZLZmhxWHdTQkZhcVFyS2k0NE1VV1R3ZlhYMlh0eTlw?=
 =?utf-8?B?OEhWUms2NGUwSDdMVDZEMldoZTBwd0taVTI0RkNDVnMxQ3gvdlg5S3RhbEZR?=
 =?utf-8?B?bG4yeDA5TFA3enc1STlBWWFXVHpqYkx4QkJMeE9lU2NjT0ZIcjE5Wkp2RWp3?=
 =?utf-8?B?eEIwY2pRclBYcWhKK0F4NS9nVXBKVW9sMnFNY2pVSkxJYTlLQ3NGc0lrTXlu?=
 =?utf-8?B?RWRibFBDZGRZNzFSa3NmdmlwTlRWRjl4Znhpa3pueW95TFlYaHdFd3ZlaXQv?=
 =?utf-8?B?anpUdEpnWlVXMzI3dmphZmZTNVo3QW1tNWNzM1p4N21aZHMxaEU0SjJDQTRn?=
 =?utf-8?B?RVdyUzNRMXpuNXJTUzdwck5nbmNtQWtkQ25zbHhPckFGWTE5Z1NQM2FkUnZa?=
 =?utf-8?B?aTUwbXdpVVByS1J4QVdBTUhIbUNyU0FnQzdZb0o3b2d2UkJlRThsWVYrRzI4?=
 =?utf-8?B?TXZJMEJSWWEvNHR2dUZMTEtmZ0gvRnZCbERXYkhpWUhOa2lWNnMxMDBrL2pI?=
 =?utf-8?B?SjJUZ2txMVBBSjJ3R3NnNHk4L1dVSVlBSVZsQ0YwUUd3cng4VGEvRmJXMHBE?=
 =?utf-8?B?UGVNcUhjS0o3SlZwSmlveFJET1UzQ3JkbUxIRnNxRGZTZmFDK3dtVGUxajh1?=
 =?utf-8?B?cUVQNHZDRlNkdERndzZRcEZzQmgzV2Zadkx0STM0N3FINHR2dzN6SkhocWZv?=
 =?utf-8?B?bEdQVDBSc3FPV2M4S0pVZ2xKcWRSVGJGazJRaGNMWlVNQlhJYnRCa0FhaEVV?=
 =?utf-8?B?d0Jkb2VSendOQWh6S1JwcjdxUldFK1dsWCtaaDB2QXovMUF5ZVhVTXhLODNC?=
 =?utf-8?B?Y21XWlJuRDhUWkt1L3IyRDY5dVRMTGhJWDJjQmNzSHhtYnJFVit6dGhDK2dy?=
 =?utf-8?B?cS92OE9UeDZ3STMxcWE5VkRIbWJqa2NiVjg0MnlZTGpTWkhBTWxrYyt0QXZI?=
 =?utf-8?B?d3h4YnhxUmhBd3krZlA1T2Q1VGMxNGxBeGhHOEVJWHp5Z3NtUUNtejdHTUtJ?=
 =?utf-8?B?ZGUwc2dSTHV6Q3ZZY2xBaVIyRGlrU2NBTzJ5RmM1ZEJFd0ZZTlc3cXR3YllK?=
 =?utf-8?B?OHAvQm1XREdNYk8xS1Z0ci9SUUppQW5uNkNzUGI2eWtmbkZ2c1dFRDMydklq?=
 =?utf-8?B?M2dZWStPWXZ5QStrOVhuRFdGUkJQemU5UDlWckNLZmZSWmU2MFFYZ3FqYXdv?=
 =?utf-8?B?aUNKNjRJeUZiQ092Zy9mSWM4V0g1TFRTUnFLUE9NTWxLVWNUdnNBcnF5aSs2?=
 =?utf-8?B?aTVoOTV3TnZlQzNhbGFKSjJZL2RldG9kbDQ4cjJ6SkNTL2EzUzJzaVJET1ZW?=
 =?utf-8?B?bmJjWm1hVEdLQjJNdU9adlZPUmR3SlIrSVYwMFRRbmhIMThRVFNaZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f70666-6c8b-48cd-4a12-08de538a719b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:32:01.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sggJqvXwzjD2kgHRLoT0X5G2Z//ZEP1n3f+rkxu3v6y4fO6VGehH4C90J9N0kF2mMJ1TzMwX9pDchKz/ROGVk11sj7XvosMQcuOWjz1lbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10930
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 16:32:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8560

Hi Robert,

On 1/8/26 3:05 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    sort of related to the OVERRIDES discussion from yesterday (on which
> i will have more whining in the near future), but was it a conscious
> decision for the bitbake user manual to not introduce the
> bitbake-getvar utility, especially since it can be used throughout the
> manual to verify explanations?
> 

bitbake-getvar is a "recent" (2021) tool. The BitBake docs typically do 
not receive much attention, so it's just waiting for someone to explain 
bitbake-getvar and replace bitbake -e with it wherever applicable :)

Can I motivate you to send patches to fix this :)?

Cheers,
Quentin

