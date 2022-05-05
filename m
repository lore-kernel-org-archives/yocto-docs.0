Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD02C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 08:08:55 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.82])
 by mx.groups.io with SMTP id smtpd.web08.8280.1651738133660552659
 for <docs@lists.yoctoproject.org>;
 Thu, 05 May 2022 01:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=WWyrHd9i;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.82,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTJ8Cr9Nrt1/v3ZZsx2k1573KYqi3zc4TRb8hLzYU5iGny4xfkZn/Cw9iu64mlCC3aQMv5zn7AfcjiSmbuvwFA9sYUIvphIqimiQLzSpwTNtiLJJvbVZU/6D3G550Xf6xHCigR6doE8aoqDLKGEZoPvhmVEj8EAFJjUWrq0Mo0HuabyNy7a+e0Qprffl4Cx3l61Bb8h1zkX+k5nWcrlgab4Pr1F0j75ZW6FmTPgxk6+P+Kn/licMZb75pWHZWYQjLR6B+EDf/6LTFogl11p5J7HAUbyhUr8z5BCIzqp78MKjX7mu/Bg8rtYHYQ3+GUaBv8iRkpcpqhG9ftjVTjHd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2AhC1n30tKenCBXKNdzFeOBno3kB7+jegBt6AKGrl4=;
 b=cawDFtSPYM/C4Oj+5nzJcW+HdDRASctOQjt/D2Hk9wr/igQFsCm+UW0Tg43W2MxFtBA9KipUFRR1veO9VY2NxZlxojY2JkeBdhloQK+tRvWHM89CjMwkHrcpeVw/R07LZsXGHO3eu0/qG7BcXeU8ty7KwcwM5X9+Ik+OgW+EPIk0HYXv5u4u+Tn22qvf3l+IqmSfP6WDq5fs+/iNulWdAZ5U73sTGGYKBlhTnXsyiYLgHJMTrofCTJa1u8APIYItVLUW2EwBhbfpWOD1ou8zH5trpehdYm4DH6VLvl5RGBG/JztyadgVGrUNj6E6fO/wgAgLgGPalzOimk1QoHvqFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2AhC1n30tKenCBXKNdzFeOBno3kB7+jegBt6AKGrl4=;
 b=WWyrHd9i/dl8U4ZCQbTvXBFEC2k6CxHcowUQUr6n20iopbHC6S1NfJofVLDqsq+hOJXvVG6ucA5IlibyzZ4JRZd+d9oYOymnwU3ZVWA/7IxqfKDRkW+dO9WFFACa9f+3ySanblCknwcBUrgU8yVWJLEtMed33M3pwkn7rQu15vU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB6PR0401MB2295.eurprd04.prod.outlook.com (2603:10a6:4:48::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 08:08:49 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb%5]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 08:08:49 +0000
Message-ID: <04c7709f-bb74-26dd-01ce-6055944d4116@theobroma-systems.com>
Date: Thu, 5 May 2022 10:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH] dev-manual: further gdb usage simplifications
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220504182400.702300-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220504182400.702300-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ebea605-9a38-47a0-624b-08da2e6e7bb7
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2295:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0401MB2295FA23123D0D863C6849B6C2C29@DB6PR0401MB2295.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sptG0Kb3Oy21jaO10C6OR/QgVEWqUz8AwFskXZf8pRc84oeIiurI8O9xPMAZiTtZxJ9yEvjXmIIYZeftL9cHCwDBg/uxtA84j3IxG6xcLRVrE5nqLDaLUOdFejUlakD4ZDc8kv+ndPBbQ8pbc+cN4zNoWy6JxSFZaiq0th9pZN0v65xJNuvZXWwbjPgURAU0wnyHVRZ8LTCSk3tqsGlUOyaycJqxoj9BCCKCB6/1CdEo0vGKcu1EvWefoFPdRehmm8542UeZ3wTeV+q9QozSPrsCVwyG6V0jQd4vFikdT6MMQtaMfCkdiQVr7JK+byMBeleevCgX79FDUTwNisd4AmX9u0vtNrptal330HTxJRN1Mur0k0uLy3GQ3LXowR9HWhVCtwBJg+nfes8rZJSEqQygQiqTAMiloEFK3VsmXH1wstU6/Ry7rQoIGWqj8CxusXBCXHEZf7fXdTRgnds7ipeY2laKKr6+ZabjutwBMXsYXIoWeZjLDAEt3uTC8DSrBwF1aO7o0D5tJx+VKvtCUxPrLwHcjMuxYJaG4HFDFnsHx+l3gtWoAYjDkKU+XknpCbcq3YgHE46a1skndqMZFmnfe04vBF1WZ5x4ucJ2r5oj6QsZkk4eH8+mQ0Kzo9xMfUo5wKlc+vVcM+qQH7e2vP/H1fY5LKIsbP20hxfG5yLd3Ib4eebEAhrn8RgRAFcx3BjqrhD11VLF5mgBVPmxX8PI7z6HrRf3riNM6U3zx9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(26005)(31686004)(6506007)(53546011)(8936002)(31696002)(86362001)(2616005)(44832011)(186003)(2906002)(83380400001)(36756003)(8676002)(66946007)(508600001)(6486002)(66556008)(66476007)(5660300002)(6666004)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWxkZERuQlpNdmV0ZHhDcS8xSStYaW05WXVZakM2Z1ZXOFo0N2VSZWRDbmtz?=
 =?utf-8?B?VzRZRDAydWhlSWxhWmJ6Z2MvL3hGdzVDc0lMWkZ0QWduQXNMNmN3SWVIcEFX?=
 =?utf-8?B?UFNmUmhGT3NCVXZJMXh5YVpnNndJV3U4V3IrQ3ZOTVFjdFpzeXliZGZ6UHU5?=
 =?utf-8?B?blp4eTU2V1NJcEkvTTJhM05yZ0lTMTlaMngzcUVyWmJnV0FVL3BsWi84QzJJ?=
 =?utf-8?B?NnZVTXZJWC85elRCNzNVQy9xS3NtY2Z3NCt2ZmxPbFFWbWFCWWVVYzgvbWhy?=
 =?utf-8?B?OUtzZjRhdDYvdnNaNkx5K3VJejNWNlNMU21GQ25qUE9wK0taTER1WWlBU3Vn?=
 =?utf-8?B?VjF0RW9ZTWNUeFo5Wnc2S01zYUV2TWJ6Ukc5emFURXBPU2lnME5EbXdCM1Jw?=
 =?utf-8?B?RkRGakN0bXVDbTRDUDNjVDQ1aFZkS3RqeEN0M2NOR3NwUi91SDNnNGJyZUo3?=
 =?utf-8?B?b2NvYitJN2NsclBWTUpxRVkxV3ZIRGRoNmFXT3o0V3FXenU0M1BCbU5SUVRo?=
 =?utf-8?B?Qm9HNUlaTXJaYUJhVFpqcGVmWU9oN2tpdTR5L0V1d0FLUkZUUmo0YkVFZWhW?=
 =?utf-8?B?K3FDSG5BVVRlOWpVWlBWRytTelRTenl4Z3p4cGFLd3oxSXpsKzI5ZXU1TW4y?=
 =?utf-8?B?akY3ZGdNOVNoZ016RnkxTlFtQ3JiM1czUGQ4MmJGUFFDd2dDdGREeDNRRjVR?=
 =?utf-8?B?TEt4YlRzYzRGQ3c1NGY5WFFDaGFheU96WHdEcitXQk5UV3NKdHQzTFcrU0pG?=
 =?utf-8?B?MHp5MzVLbCtzT2tDdkY4SjZwOVg4TVoyWDlDUjJLalJJM0ZCUTJBV285MzBE?=
 =?utf-8?B?Y2p5Ynp2N0c1cERjVHdacUxFQ0tHeFFHMUkvYTVLQmV0dWZsQ2ExRUppTnNM?=
 =?utf-8?B?QkVoMDdGNUN1d0k3UVlMYjVDQitwdGpTSTNmdUlScElBYktkNE44ZjVlMEtx?=
 =?utf-8?B?NitwTlRETWRQUGFhelZVbHIxeWlJWlNnRGd0QnVaVXJNTFhScmttQi9tTjBY?=
 =?utf-8?B?SUhZcTgwMDRubG92V3hka1RTOWx2UlR1cm8xZGFadmZiR0pGektIQ2Z1STFM?=
 =?utf-8?B?MWloQTlBanZiU2RRdWx6Y2h6cDYvMzhWZ0JkODJ4WW1EMlNMTkZ5RUJoWkRK?=
 =?utf-8?B?My80SStQUmlEMk9EVFRscHorQnRVZlBQVElJaUV5OWMwMktGdXR1T3UrKzho?=
 =?utf-8?B?YXdaN0RVeSt5ZlhhWjlrZEJBOGRwN2hvSEVsazFxNVBhVHdDNlNtdEFsZi81?=
 =?utf-8?B?ek1WYmZyQlRERExYSWg4TUYxcjJVSzBQbjNBMGdWbm5FejJ4QkpWUjNJVytq?=
 =?utf-8?B?QVFKSGtMVzZiNExtdzBiOEs1VWNramtJVlJzcU9Pb3VmbVJ3bUFDK1Jhak1R?=
 =?utf-8?B?RDQ5dyt0MmRFQll5b01uQm9hZm1UZHVFWFZGV2dpNFFyRUk0MDNJS05EeWZO?=
 =?utf-8?B?N2RrWnVubVFmdndDMG5pYUVac3JQWUY3M2pOTzdINjl3TmtUVGl5VFRaU0NH?=
 =?utf-8?B?bkkvWlhDeHQ4QjkvVVdtQmRSdzZicm5RRVBXTkpmbGxmeit4K3E4QzlLU0tS?=
 =?utf-8?B?enRhN3ZMS0xqTXhIaWVyYTdsdGhKNlVKSEhXU2xPckZNaG85QWo5M2NYdVhB?=
 =?utf-8?B?Vm56NkNwdXBkZjcvZFRIblRqMTFtRm5VTjRuUEFoSlA3K1V3YVRKZmdlbnRo?=
 =?utf-8?B?ZkFZUFdZdEdtdnZiekc3SVc4dzh2V05NbkhVYnIxUlorYVNJMDZIb1p6cGVv?=
 =?utf-8?B?NmZHWDB3dUVySWJ5NHhVcFlYeXkrRVVPNEpxNGRVM0tHaDNDdkhxMGJBMFhi?=
 =?utf-8?B?RGhlSVVYai9aQnlzMkRyNU1UYm5td2pzWEN1VkUveTNDZ1VWTTl1eWozdW9V?=
 =?utf-8?B?YnNZUE43Vm1JVy9oVkMvM09lbDJUVVcvQ3hNRzBDSU9JNDliNDNxaXpkVFM4?=
 =?utf-8?B?cUc0RFY3cXVLL0lNRDVMSWUxeG53YTltK2dRT0FaOW9maFlOTmJPbDdiM2Fz?=
 =?utf-8?B?dDhqU3dDZE1oZWR2WVhtbk9ZMWxnT2FaVXJsZ2xqMVA1Y0pFQ05OQnduRXVU?=
 =?utf-8?B?QTFHbVoxWHlLL05mbHI5L2xHSTVMbUVxZVhqOTNMVjBsb29iMEp1eW8wUkwr?=
 =?utf-8?B?dVBOQ2NkMFV0UjcreUxjTjVkRUtSd2JpQSt0d1dHY1NrU1B1TGk0WEhzdW5m?=
 =?utf-8?B?Y3ZKOUFQeVZqWGNvV0tQYVVnNHhEZzF5S0lPRWhwWlVsRnIxMS9aK2QvT3oy?=
 =?utf-8?B?a0pxQStQcFNwd0xUMnRaQXRtTGJvc1FwYy81VUtrbU4ydktSdjBuVHVQMHZu?=
 =?utf-8?B?UzhnZng1bnNJWXpCcHhtbWpGdEs5WHUxMGhTVzFsMW1LZ28vczVsVmpvSjhn?=
 =?utf-8?Q?dhpHW9I0f+4W6Ej29I+xxcu0F2ZB8duqmde8S?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ebea605-9a38-47a0-624b-08da2e6e7bb7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 08:08:49.2777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C69HBDbpTuZsOSjkgEhCx3/SW/nkm2PQI4JebkHa8fz1L9dvM08LQQQec0rTQWVXejQrnjxn+JqiWRQ131WXx0lSiFuGqOaUSrHPXCFH3MECMfaHXIEiw9H0cMhIfqJB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2295
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 May 2022 08:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2921

Hi Michael,

On 5/4/22 20:24, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/common-tasks.rst | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index c9fc585a05..8a2bfc3bb7 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10312,24 +10312,21 @@ debug on the target hardware.
>   
>   To support this kind of debugging, you need do the following:
>   
> --  Ensure that GDB is on the target. You can do this by adding "gdb" to
> -   :term:`IMAGE_INSTALL`::
> +-  Ensure that GDB is on the target. You can do this by making
> +   the following addition to your ``local.conf`` file::
>   
> -      IMAGE_INSTALL:append = " gdb"
> -
> -   Alternatively, you can add "tools-debug" to :term:`IMAGE_FEATURES`::
> -
> -      IMAGE_FEATURES:append = " tools-debug"
> +      EXTRA_IMAGE_FEATURES:append = " tools-debug"
>   
>   -  Ensure that debug symbols are present. You can make sure these
> -   symbols are present by installing ``-dbg``::
> +   symbols are present by adding the corresponding ``-dbg`` package

Maybe we can remove the repetition here?

"""
You can do so by adding the corresponding...
"""

or something like that?

> +   to :term:`IMAGE_INSTALL`::
>   
>         IMAGE_INSTALL:append = "packagename-dbg"
>   

We are missing a leading space here.

Cheers,
Quentin

