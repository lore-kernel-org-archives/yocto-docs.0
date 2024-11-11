Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22BAD2E9D3
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 10:09:48 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.82])
 by mx.groups.io with SMTP id smtpd.web11.56086.1731319783898806220
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Nov 2024 02:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dwV/X2gR;
 spf=pass (domain: cherry.de, ip: 40.107.241.82, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3qq/Kfj7WH2vqpMzgopIekwrHZUIE8Ipav5atrlrw54ERkdIM7fZ46rjIm/oqcub3VsD/Sepo9JeCJH/0jTuEyosyov4wFXctyfhgHhzp8Nvp4vOwohN7aM0SclHRjfvIU4lP3FVyK4Ads/2PisKS71WhKeFD+psvlWhFLPrGhQw3cT89kkPPLz4gg35um5wjcYtCWIkVXgp6N+nmLwxC9Wwr7i5DJ54h9EVPTOAWlB5JxK7Q1QiERvDMzPJ8PMezUJgS2cgXwXQCH3vn5/6zX+11MHpNIo1A/kwF/4PObKJ3iS5irk6GheUX7crv/3FyQbucRgs4zwb4PEA6baOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWA4ZQNuwyp0DsQO9wPiQJswe3Ietf8LhTW9qVyC7uk=;
 b=wy5TvCCoZgglMiayaCF+rzD3SH/f2bC73fc2OHtzNIj/vFVQReMugQ6qgfa6J6PSzWlXIpxAptBP9ymDp8Ai0SO4sL3IJry7gD5DWf/UKhXDxqqf3tXYGTRyr24OEg2iCw+mxw1hi6xHJoNVO8sMZiKBlUjpbX9Dm0ns0sMdP1jiorNesonEWLIvty8bGmUsgVPuFWSCK4NmporztjglbMiPF3ndJHOV4lU8J5Q8RUj8PLKGezAuX8PGhrAIDklyZSiterlnRE2oTp8zTGds+Z3OBpUYNtUHQfXn8A5YQBzDVfM6nFqCOy/dNaJAz7AO+idm1sW+ecAacM9pQXPlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWA4ZQNuwyp0DsQO9wPiQJswe3Ietf8LhTW9qVyC7uk=;
 b=dwV/X2gREZhb5E5V8SZZXxSzgf3Ym0Pf6es0Oaxr6Gubdk94b4yoo1iEqbcxZSdmnohvv5AmhMWTVqw2tdJgP3ZayWeZzR32L5hHuFtRpxGUM4xFQhfoiLPqIgZ4A2t2giXZPDurNTi0CNbV7UUbE6rtNj8Q7aB+GWbA+Z6magw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8823.eurprd04.prod.outlook.com (2603:10a6:10:2e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 10:09:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 10:09:40 +0000
Message-ID: <8271c185-a5fe-4a1d-b3a5-79b44d3edaf9@cherry.de>
Date: Mon, 11 Nov 2024 11:09:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH] contributor-guide: Remove duplicated words
To: bhstalel@gmail.com, docs@lists.yoctoproject.org
References: <20241110105742.567048-1-bhstalel@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241110105742.567048-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa5238b-f44e-45a0-4e17-08dd0238f486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cEw5ZHltME1jc3k1bTBCMFVjaHdhSlNBSHNoQXNSY0lOcCs2d0d1dGsycFNj?=
 =?utf-8?B?Ym9kczhoZjZDdzZYeWQ4RnczUGRLMVExbHBvZDBMM1Z2MDNqd3RaSit3eDRB?=
 =?utf-8?B?MlFIRFF3Ymk0WlkxSlhQbUpMT04xcll4THZXN2NtTXQzNWRXWlF1ZXNhR2xr?=
 =?utf-8?B?bDc5UFpYUFdsemR1WmU1MDB1NzlqajVKNGF0WmVQcWplWm5Kek9nWmNBQnQx?=
 =?utf-8?B?dm9ZVnhycVlSRjhlQ3hWcXUwdEVITHlEV29HSU5wOGFEbU56bU9seUhlNmxQ?=
 =?utf-8?B?Mk13dmNoNzRHQnZhYkNZRzlrazE5SU9vczVNOUppWXdOTEFFRnlCa1dUS3J0?=
 =?utf-8?B?Q1FWellrYUpjK0RFTFVlV3REaGRJUyttTTNmd2o3Z2t6OWFqNW1vZ0UwSmZS?=
 =?utf-8?B?dE8rdmJJcDRmNFlNMVh3YnVLV2FuQ1huME5ScVZpdmtZNmJnbk42VGhZSXMw?=
 =?utf-8?B?UjVnZlJIN1VwVE5RK3dRUStvUmxoaFJic25oL3ZpSTNvMGh5Q3FmemtkbW4v?=
 =?utf-8?B?UFVRVjlUMnhubUF1ZUJmOUxndWVnbXNiQUNTUnR1YU1ySVFndEVxUml3Y25L?=
 =?utf-8?B?L1JzYXVPUExwZG8rWkIxWnE3eDRzRXQ0WWJSUC9NeVJiRmtYNGhrQzZJSUVB?=
 =?utf-8?B?UXcrc25zaEh4M2h4a2xmNVJDOVFZcXhiL0xQbVE0L1BhMmdoaW94NjEzZ3lm?=
 =?utf-8?B?blJJNWNIbjRLWm1zNEpYY0ZGdFhPS0s5K1FPUnJSQS84ZTVMeWF4NWxLNnFH?=
 =?utf-8?B?MDZxRnl5aEZtblU5V1lzbHY1MXJEU0NnVWVPZzVSR3dlS3AwUXRtRXZtSGtr?=
 =?utf-8?B?ZDN5M2h6MVdHVEJ3dGtyZjV1ZWMvRlRHOGR1OU9ucW5VcGZLUm45TnlJWXZw?=
 =?utf-8?B?clZDY1hjSEZvamFmTExyR1BXYzc4N040MERueUJ4RkZ2ZE9sYVBPYnlDMmJx?=
 =?utf-8?B?KzE4bzlTcDc3NmZ0ZzMwQk1BWWRVWHNjS2VNVVlNbGh6T1NXNllJbUl5TzJm?=
 =?utf-8?B?R0YxUU03ZS9VaHArWVhHcVFBaERsU0VnQnp4dHBUTnF2M1dQdk1kN2pRME9Z?=
 =?utf-8?B?aFVFMDcySmhUUzRDc3h1THl6TTJCR1crelQxemQxK2ZFSTB0eGJPeVZMQ1pZ?=
 =?utf-8?B?OUg4dStjcGtzRnQrUG81T1hScGxOMDRpV2hTU2xxQVUvaDdQbVRiazB6c2U2?=
 =?utf-8?B?a0lmV1JuWFFud0ZRUkZEQjh1WUlnMDErNTRVTE5sUTRZN0dZbFgvN29mbHpt?=
 =?utf-8?B?OEYwY0RFUFJPMklhY3dRaUtmT2R4d2NPUDdmek9hM3l5UGZIOVZpQ0pYRVdI?=
 =?utf-8?B?VjR6MEtDOWYvS1BrRmZVS1JSeHkzRktWTDNXcDVsRVFNT3RTTElQY0ZabFVl?=
 =?utf-8?B?L0RKQ1hzd3U4eDJwaGRlbURmZ0tCSy9kamRLVmVxc1UwYzhyYTFxZ2Fac3Jk?=
 =?utf-8?B?QzZ6WjZVSnB4RjJWZ1ZpcWFnOVEyVmdaQytSS2VCUkMreHVwc0FwNE16Wmp5?=
 =?utf-8?B?QWVldytJV2RqMHFhSUZXWUZRNDJoMlR2Rkw5UWF0RkFORWRZU2RtNkZzSlBo?=
 =?utf-8?B?UkJQVDVXVGZLVVpaUVdBRzJXbTVncHJqS3o4aFA1Mnh4QU02V3BrczJlenFj?=
 =?utf-8?B?Z2diQ0hTRnJ2Z1E4Tjh6WmlHdEUrczBuTUR1M016RGlra3c0SW5HbDFYb1Zz?=
 =?utf-8?B?UjhacS8zVlBVNUFtWWFnYUtJbVl2MUlrZ0JEbEFjM2FoaHVETXBnY0hrbjRr?=
 =?utf-8?Q?VPBLW30i9Dbp1kNgefwFe+wNq+bT/owL4DMp0UF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bk4wSkVLdkNEeXU2R0hjVGRpcGRzU2R1RjNPQngrVHB6SkUvdUlGZWVhK01P?=
 =?utf-8?B?bXY0OW1INlgxcXhQMDdvSk04NldKd1RNYkg4ZFZ4R1hwZllodHdUWlMrM3NB?=
 =?utf-8?B?N0JRLzYrRWNQZmw3V29LdXJRYjJaWGFnQnI5RXlJc200MkI2Z1VTUGdwdGxy?=
 =?utf-8?B?YmNjaW9NaEFHV2tUWXRhSTZRNTllN3lFUTFYTEtUbDVEQlNTUVFpb1VBZUlH?=
 =?utf-8?B?UUpXZ1ZYQ0ZDQVY5SUdSVHMwRmd1akJKMWhSYWxYRjBaWmcrV3Y1N2hzRys2?=
 =?utf-8?B?a0RnQ3dSZFBJNEhJQkYyZ0VTek9qMG1Rc2ZiTTRBNmc0c1lSZTFDQmVvZDhG?=
 =?utf-8?B?NDE0YlRTaXdsTkJTWmhJaURjczAySW9oRmsrVjE1am9iamx6RzArb3NqSHdN?=
 =?utf-8?B?WHJrUmRmSjd3Q1hkYmlKV1pBVStVRTZ3WGRXeDh0K3JobTZUTnpIdEN6RGNp?=
 =?utf-8?B?TkxWdHpGL3RJUXI0eGxyN2xnME4vMXBNU0NQOVpvRTZFckh6UC9rVUZ3U3Zh?=
 =?utf-8?B?ZEdTQjc0cGQ2bDdNK3I1b1ViU3V6ZEZQeStUSHlyandSU0V6dy81eWRZWEQ4?=
 =?utf-8?B?eEhMTVVFRUh2ajdidTZFYUxBb2FPSmVUMjVSenlic3ZwdjM4M1ozWkl5Qzg2?=
 =?utf-8?B?Q0loTXlOV3BVS0o4a3puTmlXMW9VMXdsMmZsS0J2M05nSWVQcW9oSFJDL1JC?=
 =?utf-8?B?djZTSnpyakRjaUZiTXBQSFZWT1JjZUJWQmVsMEZjeGFYajkra0p5TzNXWit6?=
 =?utf-8?B?R3hWWTZXTWcxRjZvUDU4NXZKcUdHQnhFazZDYkNRLzVLRVBDMkJtS0JFVDBJ?=
 =?utf-8?B?clBOR1dEaUQvZ25KajIySVhUR1AyQkJNd2FIVXpCTk5ET28yTEV6MGVudVcw?=
 =?utf-8?B?TzVOZFJZRmtpTjd1eWhuVWpYbi9IdnBoR2hIVFhBZWk3STRUN2pKQUpQZ3lq?=
 =?utf-8?B?YXNwMjZEOFUvWVkxR1FheDFHcTZzMlUrc1NhZHo3ZXhZV0hpSHMwRWcxU2hC?=
 =?utf-8?B?Tk5BOWxRN2pqTWNHemRKRkhBd3NEN1htcTB1bnpUb3ltMHhMZTFkVVRGVXZV?=
 =?utf-8?B?aUh0b3k5Tkc3MUZ3Y3hTMitzQ2k0Z2toUm9kdlFZNmdIelBJaXhnT250aVJK?=
 =?utf-8?B?UHZORGxKcVVjcGVGam45QTlBR0FiTm42WTdJditEZVArUTNKbG42eDNYVlVO?=
 =?utf-8?B?VjNsSURKTG8xY1ZtdXBjOVdkZkNuZEhCanRlRkRVeUNCWDFzZ25LYVlaTUNI?=
 =?utf-8?B?SU1LSzVpdjNlV1pzS2NLTjdvam1uZ0d3d1RFTDJxbEdpKytrNFEwK3BiKzBX?=
 =?utf-8?B?WDZaSGdvVEh6clJQQjVQZHFEdFlRanNPQzNzU0NzWlJuTldHRWsxNktTd3VR?=
 =?utf-8?B?MHhLQmtHcDlUQ3IwSVlkVEVuRURBTWpqV1U4WlUrcEJ6VnlDZ1Fzb3doQjg0?=
 =?utf-8?B?N2J3cTNVbWVjUDdNVDhoZ0g4RlZFMmFlcU9nVzkvMW9PM3BZM0FPWllUYWtR?=
 =?utf-8?B?aEpVNVNyU2Y1bU1QZUw2UVZHS0JmNmdYTVA4bU4xdDlwcE90ak9Nbm1nUzly?=
 =?utf-8?B?cU9ORExhaWR3TkN0Q1UvbzJSRnZEWlVnSnFPQmpVSUNNcmV0ODhDUkg4UjVL?=
 =?utf-8?B?ejdWSlFQUEVFQzZiNzFkUFdtOUZxUDNlZHA2VWdNVTFJbEkvR21uTExoZEtx?=
 =?utf-8?B?djJBQU9pU05XNzBmenkzQ1oyQ29nc3JKbGhZMFBhNTQ5K252aU9vaWpCNWZS?=
 =?utf-8?B?Y1BPWlhrcnhlTjN2T001N0hNenFlU2toeDRRczQ2bDJzSHBsNDg2NHQ1V3My?=
 =?utf-8?B?VS8zNlh1RkJWMVRCK2t5MkJYK3ZXTkR5VTk0R3pHNXdJSFp1QVp6dkhUTnpx?=
 =?utf-8?B?YzYzdVR1Um5JMGwySkhUK2MrWkM0ZEJRNlBpZ01VVFBWVG5ib3JKZzZRVzFM?=
 =?utf-8?B?RzVGSVNvWDBVaThnVnM0QTBENlRKaTRLUi91M0pOQVJRRnBUWXZGWHVIRHlS?=
 =?utf-8?B?ejlBSlN1WmY3VUFBeGRzZUZac3h4T3F5MmhzS25OVGpVMjJZdld5b0Y4dWQ0?=
 =?utf-8?B?bTdJd0hDWTlUOVA2VS9kMVFnYko0Unp3WmtDek53amRZMWN1RXk5WFo0QnNT?=
 =?utf-8?B?Q1N2dkRUM2dOeWpaUmpGR3RDOVJuVVdHbUs2V3pxUGhKbTc0blJ6MGpnME1s?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa5238b-f44e-45a0-4e17-08dd0238f486
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 10:09:40.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM7SfzTcdKWuTcIIOnRPDxCcMlhwt/tR03TTPYEIVYsK8Zj2+JlOX1lSqmvhTQIwT53ENxdieVReCBfwGpnTfgMO73YrJ2eUi6kq29wii+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8823
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Nov 2024 10:09:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5712

Hi Talel,

On 11/10/24 11:57 AM, BELHADJ SALEM Talel via lists.yoctoproject.org wrote:
> Remove "and then" as it is duplicated.
> 
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

