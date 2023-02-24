Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330FFC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:14:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web10.14505.1677233680142729536
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=jQKoy1lW;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.73, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDxm7bWDLjqZH+4zWWWmfHZcyBIy6FKZFdtH3Syez4wjTfa1gbgaCfqmbO/l4nS0hQ7chLM2Wzh6V0aphRZRHWUYkoIMkvdL4JKCND6hp3THTPIgnXBaGSAmKIuvmN/sdcp+XWT8Q/BKZvVH7npEPmSuenxMXQktZkXSefHPeC0VQCJfNnmrvFALuTk6PpNJZYYiy9Fesidp1h2mmUKPswRde+I2wNEYgqNzAP75JirsNThVjo1IS5j0QCV1SEUnOgX5LYpnyCe5TUsJN07ZL31fA2Ayuzlam13pv/uQTSgJRz0JJXg4EN8GMSZmAYegxIic5kQVtoE8NDEd93etQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baYfCE6jElzpkc75bYhQryOselixMu0/D+G2DshyWm0=;
 b=M9E+inwTyoYjs/STasZyA3f1JHM+INTSIVzxZQ03bVzcR5ImhmWv7uSOYA9xkmJIXPEDs8BpPPMQdRTuLdXlb5yc8Y/ZriA6keN7CoqBCGSNRMpYorJUzBa5xGwRzqDJVP4JB2vtRRb1fYmsGPTs+KdSL5Qhzd2LlLfRc3iE+UaGe6uO8C0cJCjRJJL/cYKNOQZPcZKiRtj8IHAj8KRfuVlXuQIp8AZHSPlRRM9Ov44pu1yuRhYJLdQWq/Ra9SGe0uW/ytlxt5LhC1A4PjeDo3+OAcHLkm2cM8tCvNHcy7+nMlBuFfNhIUZToadfNJHXWKhqbyGVPa8jHFGsEGeSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baYfCE6jElzpkc75bYhQryOselixMu0/D+G2DshyWm0=;
 b=jQKoy1lWq2rca+hYaFMUWdPX+ynpx9a8uEtzEF/+yECNFEMYya8PbNXDMU/UbkV0rLdCYTieGnzIkZi2Y8CqOZSK9VECopfGmYdZM127MyTd67OhVj2EJYbcmeYOIZ+N8wrrOn8B1j8fVGzheo5z8xFBlngw6C+uDzJMfFQeUNxf3oKuORkawXVWtPHdpWBUBR5SOyILX3Z/EQpCdv16HDPesf4HfmV+6Uqc1i1BKJfwoXR6n9XZHJsq8ggyDZLgCNib10iP0VHgVCYm04jzMdhETgcffKbXiqGnO2sidYkSRUZmHZ1YXeOpzDs20B+86QGX/LkbRo9aQhanyga0EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 10:14:37 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%4]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 10:14:36 +0000
Message-ID: <354e06b1-c01a-9db5-692f-0c0dda040e2b@theobroma-systems.com>
Date: Fri, 24 Feb 2023 11:14:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] ref-manual: update DEV_PKG_DEPENDENCY in variables
Content-Language: en-US
To: Fawzi KHABER <fawzi.khaber@smile.fr>, docs@lists.yoctoproject.org
Cc: Yoann CONGAL <yoann.congal@smile.fr>
References: <20230223103636.10170-1-fawzi.khaber@smile.fr>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230223103636.10170-1-fawzi.khaber@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6506bc-b69b-4af2-654c-08db164feea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K0B7PRAXYsn/G+8LB0+3dvf9SaEkG19O1zMvjUtdKqOUX/d4TMgMT8zfvwdIyqd8v1LuLzAuWM1/Yh71NB6pL1yShYTbvxZ2G9t3K5hbpqOzYe6sb6wpWXlcs9cObTIHs4vsop7P3J5Q10/10Ppg4GJpM5U2IXgY8KTF6vZrA2j2oA31EX9ecd2KgmLmwMXWjd/kyeGYiFZ2ZkqEJubRW62n14AHfZH8m1UWS4SEmSndikj+oWCDjLM1zTIa9GVU/deb+UApfRUjVQ/AYJYxijSXp+kXRksyLrg2+leH8n/rZMKEWHxGMIprLXtuNzFXdfuwdGm5zx9ETtqWGA3jIiCvbyWuljaxo2nGBlDsKyuxEicDvJUS5J8L3FS93tR1N4RdRKQGpu6BHpI05Is6Uam8MPEjaYO2PFLHS6z5Oq8OmZvOspGTy5kSEOBFqG/oTqJlW4AGBnI8plAyw0CkuNysS/d+LjesXSj243aPwtn7JWC98u4/wZrzchXqpGjYMVfHNzqnAeQv8SQ+ow7AcI6oCKtKYRHn54KehVdq+SV5gPMUQ867MEX3YO6/yWDC+wThMX+Pv3YjuV25pvUTxYbwc8VTTTaFjbI3rcus/Hq+nMAz3jQkdLYfcGGkH/2W/03WvxQiCZcvMG0umeA63EcRLN3mcS7Xg0yTuVlM2BFDXsxJH5chJzdfMu7zmXhV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(136003)(346002)(396003)(366004)(451199018)(478600001)(31696002)(38100700002)(44832011)(2906002)(86362001)(316002)(41300700001)(8676002)(5660300002)(66556008)(36756003)(4326008)(66476007)(8936002)(66946007)(2616005)(6486002)(31686004)(26005)(186003)(6512007)(53546011)(84970400001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHduRFJCQnUrWmlHeVpDVUlnUXlrSVhENEpwWCthYTdqZC80NVUrd0xxbk5L?=
 =?utf-8?B?YXMrSHpzWWhzSEExSk4rMGxlYkg2SWZuRnI5OUFWRUFxRzJsNHFOa3B0VlpK?=
 =?utf-8?B?TDBaMWJGekhERkVXTnBocWlyeXA1YytNTzdjSnBkaVg5WVRtTDROZVBZSDl6?=
 =?utf-8?B?MG9YWGduOFQyYUtQT0NZNis2UmUyVGIvR3I1VWFKb29tc2VGcU1Qa2kxWWRU?=
 =?utf-8?B?NWsxQk5yRGVjRGJKTlNuQ2Q5YlpLR3FSdGJ6R2FKMndnc2xmMTRUYWpmcXJS?=
 =?utf-8?B?U2hQSVJnL3hNWFB6SktZN0p3UjdpTVZZdmpQVGFsblpwcDRwV3NpZjY1dTRq?=
 =?utf-8?B?akNyR1ZYOGh6YzBaVnlmQzBIWWpEK3Z1TlJDM3pYVVhjeXd5SXhOKy85cG1i?=
 =?utf-8?B?SzhrM0RVbzlWS29hNkhhUnlBOE1vVnhKN3N4VmtYZHpvTVRCRXNidWVMdjQ1?=
 =?utf-8?B?aU5FSEIyVUtTOXVGeWQ1UEloV0Y2VEo5K0h0aDVzR3UwNTFOTzk5QUNYNVhN?=
 =?utf-8?B?Z1RZQm9ZaVRGdHJ4SFFBNzV5eHRybHArUTE4RTM4R2lrTTRUL2tudVo0S3Bo?=
 =?utf-8?B?OGoyR043ZGNzVjVRaWtyNElSVkRSZDM1eDJZSjUwV3dEUFpZbVBwVk92ZHo0?=
 =?utf-8?B?MmdDUmNDZWVXZEFocDJXMy9hdkNSNzg1ZTF2M3BUdzh3dFNabTV2Snhvbkoy?=
 =?utf-8?B?RFBZdFBJN2xFWGJuTDc2YU53UjB2QTRiM1hBeStRbXB3ZkZkNzhPSHZwYmJm?=
 =?utf-8?B?SjhtT25rR2RJdXJCcTZhU1ZyMGdNUTU1ak0vd1A0VXJWVTFJbWZiblduTy9q?=
 =?utf-8?B?YW0rV041MitUQzYrNGloalVOalA1SEI1RzZhOExZdmtSeWJGSFcwVmF6WXZD?=
 =?utf-8?B?TDl1V2lIRytkWUVETndnN3BvUnZEMGhlYW5mZjRIRkY1OUptRTVWbXZzVTZW?=
 =?utf-8?B?a0JkVloybVQwRkdLaEllWWV1VEZZMWwvWHA0ZUk4TitwcFhBUTdqTWhWdDJW?=
 =?utf-8?B?bXJ5T0VmT0ZvM3lBQlRYRFQwVEtZZlQ3NVBKbjBVUUFVNnd0TDY4L3pKelBa?=
 =?utf-8?B?TFdJUHlMT010U1ZBbFg1VmlJRWFFMlJ6OU5mWTFZY3psQ0xjYzhpTHpxdTht?=
 =?utf-8?B?SWFlTW5iK0JETnRlZzNpcG9SWXYxcUxZL21JT1RXY01KOGtPRTBlKzFvNmJl?=
 =?utf-8?B?MmF0TnJWRmhQRjF5ZTBudXUvNDB4WU93SUZKTnN4Y201dENWekFvK2RkWFov?=
 =?utf-8?B?bnFlUHhFRTZHL3dYZXdrTkdTSlVTV0JpWkRqODJwT0phRXhsUWNHa29sSmJX?=
 =?utf-8?B?Y3hJTVJlSXZteEFUVHJBUnNjM0VSZzM0M0JZdWpDanhEWWxqcGRXRC9BcmNY?=
 =?utf-8?B?akljckFHUHo5MnVNK24xZ2NyWVZYNUNtMGc4cm94U3NJUDdqS3A5OXNLWXh4?=
 =?utf-8?B?ajNxbFIvTUlWemlSS2N4MzFud1JGZUxKQ0t6b1MrYUI3S3A2UGxsQkN0dGVJ?=
 =?utf-8?B?RzdYVWQ0ZjJGdFVYMmhGWUlVblZhaFV2TGMwa0h1ZW0vZk1IUUZmT05YaUQw?=
 =?utf-8?B?ZlJabmlUZTV1ZWRDMlROUkFLZHZwOWNaYXdEdzJyMFJ2UDBhTXl2YzJ3Z3dl?=
 =?utf-8?B?RjZuMWgwMWNrUlJPRzc5ZzcxZWVRYmIwSVFmRzhXMjRSRkNLUmNGV0I0TmFu?=
 =?utf-8?B?UFNkOHBja0t1MUtLdGI3RTNYWUQ4VmZVcUs3ZFBUVzBlTlNFcWZ0MitZSmpY?=
 =?utf-8?B?ODlmSHJNbGw5eDRHeHpWMC9sM21aUDkxUHlFUkp3b29JeU9tNThXNlBHSC8w?=
 =?utf-8?B?dWtheVh0TjZVbGY4ZjVzRHEraWY1b24xdngwYWFlaGsvSCtURkhXQWltM3Fs?=
 =?utf-8?B?VS9sK2sycWh4eW5wcGlsc2QrOFEzWVZtV3YycDJjL1lESE5DV3pqY1hSWXov?=
 =?utf-8?B?Q1AxcU85KzNNRm00UEhZYnN1QkYrNk5OWG5rV1l0ZVFZK2pwa1pmNWo4WXNp?=
 =?utf-8?B?NFVVSTJiaGs1TGtzZDdRdWcyVWF4dWxLTHVQRHBsRUpiZG9uU2FlOGZNY1Jl?=
 =?utf-8?B?bzlEUU56elZXanZhZ3ZuVGs4SkJVM2tmaGhpQ2ZvSlJwMTdPTXpwZzB5THpu?=
 =?utf-8?B?aENmeFhKbUVUODV1SmY4UDZnWlFXTkpkaVFiU3Fid3QwOXhOejBsVityZDJv?=
 =?utf-8?Q?XYgAUcfjvPaew+smeZm/Yw4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6506bc-b69b-4af2-654c-08db164feea7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 10:14:36.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VasEY6LqzRE+DIxIM5SN0/WRbLQD/ss6LDNv7F8m8YW+7sqONSuRRmrHhfIRsuxiwS4fQ7oaMHiOIFQ1MJVk1Jb7sIr0DL7kn7TaLA+AutKR51xRZ0G+oitm8Y+aT0s7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:14:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3734

Hi Fawzi,

On 2/23/23 11:36, Fawzi KHABER wrote:
> Since release 4.1, the variable DEV_PKG_DEPENDENCY sets RRECOMMENDS unstead
> of RDEPENDS for the -dev package on the main package, this change fix the
> documentation the match the actual state
> 

This is somewhat misleading.

DEV_PKG_DEPENDENCY was introduced in 4.1 and started by being used as 
RDEPENDS but then migrated to RRECOMMENDS during the normal development 
phase of the 4.1 release (before the first release actually).

Why it was important to me was to understand if we needed to backport 
this to 4.1 release docs and maybe even earlier.

FWIW, the commit introducing the mechanism is:
73cf55cdde1f ("bitbake.conf/recipes: Introduce add DEV_PKG_DEPENDENCY to 
change RDEPENDS:${PN}-dev")
and migrating to RRECOMMENDS:
ddbd90a37c7e ("bitbake.conf: Change -dev RDEPENDS to RRECOMMENDS")
(in poky).

In any case, the suggested change is correct, so
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

@Michael, this is a candidate for langdale backport.

Thanks,
Quentin

