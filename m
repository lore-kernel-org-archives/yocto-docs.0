Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5010DCD5BB1
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 10:07:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20391.1763028439629757773
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 02:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DD1PoCUM;
 spf=pass (domain: cherry.de, ip: 40.107.130.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvC3Ua+IR23dRi5m2Re7mxXpUYZ5HMpGvObxj4ClcPh+/nI9AU83w1AgSxA9Je/4VQ9MbHhtOMXUIxMNJmcbxPZhC6Vm51PIkrQeTW/ctu6ibpgEUF34gacg85mMzBBayx9MKwiHDeaJ1AR2Vj+pimekQP+n6t4oP0GpB3DkloKhsF6vnfB/hycf+nIJSFuRvyulUUYuKlUsAbzhZCKTPAcMYOXPFtGH0euGY7FS1V7STAx8bZdB6nhn9qBr5YgeM3wJVXBfllYxnxBwtIicgc2i1tmji4nOw2Y/O4RGRTfUfk8RMuqqunjMP8pM8nZd81Oh9wNk3XiLYs2kXvz55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx0jucQcKQ3h1YyFYyKqljrGrx+qH8BChF7ugdynX4k=;
 b=c1l2JLNMs01vYhPaJg/OWsBMRAKFKETZRwEiVTSvzstjnBMxmvY7Hiww1snBR2HaLMBzj3ZRdajwtYskk5TkJjkwiYfvYc8yS6OgqKDzr0nFPmxKjZdbBigQBQgEk/ydKy+LWkKufW62LyXZphzaxSPNiRe7O29dSex7ev+IcXq3n4/jbF7JPRIUpUhwd67OYt500arDypfe+TmJhmGDbJaRgjBSTFeIC6y/wfDGiLlVWLiLYHFux6OtSKqYd8pXbT3zFskeA1Zf9c4FjH6F8yUalC/dJrMn1+E0DbOwRn0KAmbmk0yqqY2WR9Ven4DC0qPsJhrAe1BgOr7DWvdRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx0jucQcKQ3h1YyFYyKqljrGrx+qH8BChF7ugdynX4k=;
 b=DD1PoCUMHRXEiZ6LCGRtQTqgTHd3T4AA0mXoHRf1/lzbbWeGrXnI8cp6myWbnbv4QUOHAtzruU7crqKevGEAPZSN6iME8zeL+KjX3vYPCe1nRMkhpC/hceYEoH/5yiklLHUJVsx+j2q0IYmpEoPcXk36/YD0MWPh5uuyeEu/nZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10382.eurprd04.prod.outlook.com (2603:10a6:150:1eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 10:07:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 10:07:12 +0000
Message-ID: <aab4e0ab-839a-4900-a91f-87bdcd322220@cherry.de>
Date: Thu, 13 Nov 2025 11:07:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ubuntu
 25.10 to supported distros
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20251113-add-ubuntu-25-10-v1-1-092133ab6d40@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251113-add-ubuntu-25-10-v1-1-092133ab6d40@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10382:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e25ac7-875d-4d13-fd3b-08de229c6a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjFWVHRiZHE2TXhDVFcva0lUMjkzTUZUcWw4UGFGcTlUWUJxL3loRHZNZ2xK?=
 =?utf-8?B?L2E3cURyczByTmxIWTRudVJHWDFsTUVmVEp2bmZmaHhFMDJjZFc1THNhR1Vn?=
 =?utf-8?B?cVY3M1dIOXNxR3kyWXB1OGIwUDEwbmhmaUcyLy9NckxlemYyU2ptYWkxckFN?=
 =?utf-8?B?YTg1SDhFS2J1RnFMUmF4UFByNVlxVzFnbTgwR2FCOURsVWdNRjNXWlV4bGpH?=
 =?utf-8?B?ai9XMTZTcExsb1QvbWEyNDRRZy9nbkNTSXVKRmd6RnZpd29CdFJDNitIZ1h4?=
 =?utf-8?B?SHlqUjRUNnNKSWNnWm5yKzMyQ3VmSlByMzE4NDR3bmVid1VpcHlRZ2NES1hk?=
 =?utf-8?B?eG9nR3g5RGZFYmY5cXVvNWZRRW9WUi9OZ0xLa1RHeERHVElBTTVpd3BzRWx2?=
 =?utf-8?B?aUVIanYyQjNCT0NpeGFXRmtlVW9WeXhWbEloTHh0RGZxUGFXUDZLSjliL016?=
 =?utf-8?B?NW9IYnNiYWtnMTg2S1hZd0RoUmlZTEtBK09PYmdFb2haa2FXS0hEanBZaHNV?=
 =?utf-8?B?K1lPN2xKQTBEOTlpYUxrT1dFZ2lyOWsxZHpWTk1XK0tyM25VSy9lWjVNdTZM?=
 =?utf-8?B?aDdNTThyWTM5eVVuSW1UOFNPblBoUU5IYklmT0JDM3R3bDdhb1hvOXQvZU0v?=
 =?utf-8?B?NnRYUFdteGhEdTlLV1ZzUGhxbU5rNktXaGxTNFl0UUpEVE1QckZzMkRpQ1ly?=
 =?utf-8?B?aGptN2FGemc0dVpzRHdLTkNVUHFRNzFmWnNIK09ER0RMOGhQek5kZFdBMVBj?=
 =?utf-8?B?YkRHYmM3S2dhN0JaeDF5KzUwaG0vVjhJVmhWYUd1NHpyeGtpRlhMeE5zeVNS?=
 =?utf-8?B?WHNmQmlJcVNlVGxIUCswNzlUUWhvVDdGck1aeXB3MnFrWU1OSTlhckN2WFJ4?=
 =?utf-8?B?dzFmZDYrbGRzWkRRdUxTTzgyNUg5S1kvY0Z3ZXIvZ1hhWjlPU0VCUkdSazJT?=
 =?utf-8?B?d2FZenNjUlBBUVZMMjZzVWNOcGx0cXB0a29kcXI0bjVXdnVGS2M2MjNyRnRH?=
 =?utf-8?B?aG4xNEtvVVA2SGR2d1p5MmlYWFFQN0NCaWJ2aytOai9ZMmloaG1JT3MvVWpm?=
 =?utf-8?B?M1NZeGJRVDhTWnlqTWlaVGtUSW1UbTJUTHA0ektnbW1BQzViWnZyUjljeklu?=
 =?utf-8?B?MEluWklHdDVOUDc4ZGhJLzR4Q1hNQlFObFlsR3JhUmNseGc4WkdFb0x3Tkp0?=
 =?utf-8?B?RXZURzdxY3hSQmY3dnBxeWFiUFpxSWt6d284Vkk4NjNBRmJrNkszUFBxblVw?=
 =?utf-8?B?eGdDb1gybDhMVTd1bTVHeHRyblV4OGtQVmliMy9FOERKb3U2MlljK1BtVnZh?=
 =?utf-8?B?VjVNSVZPbzFET2g2SXFieHphSk02cDlwdlBWWDZ0SUJkME5vTlpFU0R4N3Rl?=
 =?utf-8?B?QXJPNEVYZGV3WjRQQlhOa21uVU1OdUpxM3VuMnBQMmU0Q3FOVVNsdThMWG5v?=
 =?utf-8?B?RWs2QjRJNUwybzVYTE5GQUJXNlp2ZytqN0hrWjd2VGU2S1BGRGFjVnVoQmhp?=
 =?utf-8?B?ZEVvVFFtb05YaERNd2JwMVVoRXBDUjFHRXRkQzYyL2hBN0FkNUFoOGxMS216?=
 =?utf-8?B?Umh2cDhJV1hqOG0zcVFrQ1JIMVRHcjJCUWRaNEJxQk1meVVRcUpjZGVBZFVK?=
 =?utf-8?B?RklWZEt0b0hWVklZa1pNK2grK3ZZdnJCTHJKTmU1eUNSc1FjN1ZHVVNGMEE0?=
 =?utf-8?B?U2dhM25McUJnTmxDVlpFbVg0WWZQVkJubUxoZjFNdUVtQkFhNmR5VlAvNmFR?=
 =?utf-8?B?MHZGd3hHN3NJc2xzRERwYlVyb3I2cVorVG1KeWQxT3dsaFZQTUwxUFJTMWdL?=
 =?utf-8?B?TzhqcGtiZVdEL2VVZ0lneCtwZEZoTlRGYmlnV3NoL0owaDJULzJEekkraVJC?=
 =?utf-8?B?dGhVZXZsRW5VWmNNcmIxa2dmZFFxeGhpZFBsS3h6TWliUGtYY1dLNjZjTWYv?=
 =?utf-8?B?SWYwdlNpcWRmcjE1dHNERG5TRFc5SlhxcGQ2WU5vbUMzUzUvTWFCWC9oV1ZV?=
 =?utf-8?B?QlYwRWkwNEdnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWt4R0UxY3M1VkpJVHBYVm00K2RDMzloQTEycDRZVFphUGp1NndxOTdIN1gy?=
 =?utf-8?B?RWJaZnZqNTBWWTZrMHB1OGVmcFpvcUs4aDVDVG4xVGJ1UzFBNVREQXltdER1?=
 =?utf-8?B?RGRkTWg2TmpMRFYxS0poK1RBWWN1TDR5U05mdCtGNkxycVRKNXp5V2k1Z1lL?=
 =?utf-8?B?aERVNURxL3M2emluTjdUUXRXdHZTK1RxUmFWZjJxT0oyemQ3VUllUnRVU0V3?=
 =?utf-8?B?dmZFbVFGZGJESEN1aXFIdHVWb3NOUzEvcUtDNUZhT2VWOGpJRnRzcUJqZUMw?=
 =?utf-8?B?YlVzQUFEMm5kcURINGJKRVRqNHFnY081c05CdmpXamJZbmE0emMrTFVFTEto?=
 =?utf-8?B?bVZ6U2FjYzNSNnhmanZUajVmRVo0N2JpVVNSQXA2VkQ1TkNBVTZsdXFVb244?=
 =?utf-8?B?K3dMbnRwMU1UV0RuaUNrZGsrNGpPeFRubmM4RHh0SkhGMGt1MTluOTFjOHJ5?=
 =?utf-8?B?WDlHZWlsM3k4eXRUNkZabmw4bWhhTFcwUFkvOVNldTJMa3FTdHhpU2lCMGNJ?=
 =?utf-8?B?OTRIa0Y1ajllTVllbnZ0a0xSNUdMcklxUXUvcWtMSkNMbjJqbk44MGdLZExr?=
 =?utf-8?B?VHhpYlFJcXFudnJIVGZMQjN5d3RtS0tKMzI2WmJDcWpwTnBveERrVE1ieUx2?=
 =?utf-8?B?SXVvbjM3U2NwSzZwZVBGSXhHMjdySDVtdnRHYzlSQzVZWWIzdkJZbSs2Vm10?=
 =?utf-8?B?b1VsdDR4RDR3ZVNKMWtic0JIUDBtYlBLRTlEYzB2NHlVY0oyYmt2aTdEbW1M?=
 =?utf-8?B?anROMll3eW1nWnBDMnpkS2xZbkFGNGt4SlV5bUl4WGh5ZC9TNE5Ga1VObHFP?=
 =?utf-8?B?KzJjUVNJSWN3bHgvR2xWZk5VYi9VUXBUb1BCWnNNWVphZStNTFNGU1U4VjlM?=
 =?utf-8?B?Qko3UjdqQThUa2I2YzFTVEN6MnM3NHhoSUprMUd1aXBNdElVMU15dWUyNFIr?=
 =?utf-8?B?dmNyTm5idEQ1T0pzaHVuSW9qRzF5MEwvcG5lUTNoVTc0TU1uV29hQ0NUUmhO?=
 =?utf-8?B?UmUwbnFoL3BrMGp4a0Rpd2NNbDVVU2RJNFo0U0ZjQVB2ZDYxRm5HVkhnQmYz?=
 =?utf-8?B?VkZET0xkQ1NRa2ZXbHhXYWFzcFFjVGkrWnA5QkNydWIzY0ZtbnNnalR6Ky9E?=
 =?utf-8?B?WHJzdzhSUDRoTEMrK1U1RXZlbkVSUVBHaG9yZXNmRExBOVlhaWg5UVF0MFlI?=
 =?utf-8?B?MTdUOTBidHpGU2EvelJOaitxcjlNemNvWmg4bm9LT216VEV0cnQ0SFRrSDdx?=
 =?utf-8?B?L0U2QUJUT2g4NXBXNnBNS1RpQ29iRWliQ0VZSWFBRWlZcHhBaHVtZ3ZiVjBl?=
 =?utf-8?B?OVhpZWlEZys0czNwdUNRdTNtQ0JjL01ZNGpVODhmSjdtVHI3ak9yMXZIM1Rw?=
 =?utf-8?B?bTBlTTBqMTYyUTMxaVNXVnVwR2RLRzBVSEFWL2VLN2pKdmRQM0dVUEJYellr?=
 =?utf-8?B?OUttaHZxZmtNdkJkNXdYMXNEeHpWWTBYYlloUTcxanhaWHhmWkphZXl3SDln?=
 =?utf-8?B?WjF5TkhLaFZ3RW4yV3FtdEU3ejB4WXVDQ1prMGNGUmNXZXM2QWNNL0VnbWJ3?=
 =?utf-8?B?SEdPS2kzamd0R2VXZlVQbTBnQzdGakNSQUlzOGlXT2xZblVxSjMvRFRseHVU?=
 =?utf-8?B?bHlwTzM3aHYxTHp4ZmIwbjRHNnJVcWpzRmdod3V0NHVSUTN5dUp5VlhGMFBK?=
 =?utf-8?B?N0xMRGY0WlNjVGFmdHdRRkpIbDM4NEtNTjR5UkRIUi9EZE4yWENGL21oSDZS?=
 =?utf-8?B?QVdFNEZqR3l1eGJNT055WU9DNTV1L05VT3B3d0xDWjZNYjkzZ1FkUWtiUEI0?=
 =?utf-8?B?OU9Sd3o3a3QwYWtvM1llVHJ2S0JLUDZVWGxCUXFQeVZxdXlPMUxiODdVUkxX?=
 =?utf-8?B?SGJMVTBCdVltdnVpMDdkbTh4ejgrbmpORXM2RStwZEhzL3JXMWtSbXVlcVFh?=
 =?utf-8?B?dG5JcVlDbFdxY0pCV01qcm9TbkpSQm52YnpSMXdNZUY3Wkd3d0E3WWVIS1Vi?=
 =?utf-8?B?WDRUQlg2bmZHV0tqQUxXS1NhL05yRExpRzh2bGxoM1dzTyt6a1VsQlV2Rksx?=
 =?utf-8?B?U2wxWDdIU2ZEYW8yM0NSQWRBaWVLRlRLSkNhWEo3dGU5eFFqbHJRY3JTY2Mv?=
 =?utf-8?B?NDZ3c2hxU1dTODFRTkVBR1hwNGIveDBQdFRNK0xyU2YwUVg1elpPdHpKYkl3?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e25ac7-875d-4d13-fd3b-08de229c6a1c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 10:07:12.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TW/aflyAPG3uWLpx4uF0tjN6QX5n1QoHvrm77MqeJUwq5Zp+EyFSzLyFC/2ZC8qqaaevhiaWdPJe1EDszsUIoDV825S12n0gtNKzscP7ncA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10382
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 10:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8031

Hi Antonin,

On 11/13/25 10:03 AM, Antonin Godard via lists.yoctoproject.org wrote:
> After it was added to meta-yocto/meta-poky's sanity.conf.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Note: merge when either is merged:
> * https://lore.kernel.org/r/20251112224534.3094578-1-richard.purdie@linuxfoundation.org
> * https://lore.kernel.org/r/20251111-contrib-mathieu-ubuntu_2510-v1-1-4e50cc96eb00@bootlin.com
> ---
>   documentation/ref-manual/system-requirements.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index fcefd6c7a..0860c7a3f 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -79,6 +79,7 @@ supported on the following distributions:
>   -  Ubuntu 22.04 (LTS)
>   -  Ubuntu 24.04 (LTS)
>   -  Ubuntu 25.04
> +-  Ubuntu 25.10
>   

We should probably update documentation/tools/build-docs-container to 
also be able to build for Ubuntu 25.10 (and make sure we can actually 
build stuff with it :) ).

https://lore.kernel.org/yocto-patches/CADfgfoZh_6cw3YnapQR3DfrWah3Prp1aj6-d5tJW_jJN5u28CQ@mail.gmail.com/ 
adds fedora 43 workers as well, but I guess it's too early for marking 
that as tested distro :)

Cheers,
Quentin

