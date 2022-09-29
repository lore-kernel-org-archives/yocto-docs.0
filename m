Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA4FC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 12:03:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.83])
 by mx.groups.io with SMTP id smtpd.web10.9196.1664453014044554969
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 05:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=HsCO4XM+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.83,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsTk9W7N7GbR06vq8toaGrPNvJdFlQHs7eopB+ROS0AQkLhdxC7fhVbzVLkT2JU2r19ZDWLmLS0yY3icf0WSo0qRYvGD6ZsBwIsMtUgwz9DeqyUZu77xZM4iEYGKNaIWOSJZia4mfr3ybE4NpNBW6JEi2q2x7d9rmOoKZ3ra2TBmrOoUnQx4+2txI1zN628yGvjQUSj//JFqy4E+EVYtBVgKEntNpHZ5ozxrVati8qMLDanfvyJ8TJ0NkIoldz0DEJX0ty4e6b4B6ciPhBS7Uxx9PdtGjo0TfnA/e64gPt5h0l+vUaE8aS/S3Wm8Q4ur+yNsmYUGKIqDn67EcKRZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNRHak/+MPXvw38eZJCHk/ZdF/7ClRdu1y5jU3ScXLc=;
 b=DFV74pbUe41l9/5aaVCu98B+rFeGYaQR1tkvjsPW8dru4E99japTsevVPl/UToBxUZrAMfL2cbzDdH/lPQ37Ha8WkbB8IucC54tHXoQdWuae2MjLIvaeEzAoz5KxJaPAiHmHdsochmRSDjXnXfl/XE0ntjJ+T5LfXqWHOijiU40X1vIQ4HxUjin383BPoRcqRTwQN0DrMiw5VMRdqavE21K2IH5rz/T55f7OlOKAO6eQppIbAx5FyTbgPS+Xg2JpL4+oFQDzy9ToJE39x5Cb1AhqQEQ8Ifc4M/OWmG7shLUoL9Kv36WCLOoX+CPdvj5KrHSQOfWEPmnCae4UpWHLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNRHak/+MPXvw38eZJCHk/ZdF/7ClRdu1y5jU3ScXLc=;
 b=HsCO4XM+LHyo1OkcjFeed1HZyWDGL/hpB3FrMkvxbrjCvTlkot+kqe/fUo/VYeUcZhLJYV72jvB1omo7KML6/qw7TLQiGh4eg1yWh5KCI/8RAwlXo7C5LONsy16L4vRnz/oxG0nYzqYyus+wXeYmjpgREUabQLeyp3khyqsat+42tTgS+nT5p3JUpklwnNuCYSONU+g5qJu9Tq4OI6BfbUirJ4K60dUkz2sjssxnVPQBwoyMurk8eHB2bnn4qySjpHieLnM+AyE3ATob3q7rG0fUf+nTWrFEmJa8TvqAU2GC8+tBGj+U+ulbHExkDh6d0VOGDOYzJESNPyprw65tiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM0PR04MB7028.eurprd04.prod.outlook.com (2603:10a6:208:19a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 12:03:31 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.025; Thu, 29 Sep 2022
 12:03:30 +0000
Message-ID: <b583ce6c-995a-beb1-47d0-9b36f6ac828f@theobroma-systems.com>
Date: Thu, 29 Sep 2022 14:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: quentin.schulz@theobroma-systems.com
To: Johan Korsnes <johan.korsnes@remarkable.no>, docs@lists.yoctoproject.org,
 Johan Korsnes <johan.korsnes@remarkable.no>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] migration guides: 3.4: remove spurious space in example
References: <20220929115305.254957-1-johan.korsnes@remarkable.no>
In-Reply-To: <20220929115305.254957-1-johan.korsnes@remarkable.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM0PR04MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 885e2380-0b50-4172-16e4-08daa212a01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3eXTUMRFkwRzUrFcCunhGAe6Q1YJmUL+MfccUmCbG63p4UmtveN4w1+fKwS1Bg5j0QL8gDKe+g6RqJJJc07UjDY8bh4+D5fwp2PLg7cqVGIIiwDUdtFxwTVOEC20SblUVIqYTHLiS3MInAFzrLtAfbqUCfNy9f9jh4S8J2bhGEqQYi40LGPEtlUGogw26UlcKFGNh4g4ItW+zmj+VK5EnVoBB6d0kGjJSsm/BWUTJrxLP4g0wdDUcrkD6Rmdjudbt5Z9HxVuNrs01v4b4lqIxkCLHL7pvJYsc3+aFJJzR4yC53zOgfLqJbq+EZ2Mk3wLo9oGVBId2/TkxzEIf1tOVf5NmtA4WRTWXuY69W8IsrL0tGBZ83hvA4b9isqJnfjAy01RXoMm824QaV4rj3+WXIonp07gPNrT8hEOMUReTlVG7dRRqgS5uY0LGuxJ002hv2bq8KbdXbWc0dpuXgbgCofVeC5JEzCvNcsN1ZdylFk0pLxYXEvjcCoXo3KqOrmg7BXWWoV3ApLQDM4H7c9axDsWDL+DefrxqRInma6uHIG0G2wWMzT8YfjOzLxy4N2wdhw3sVhf4pz732pHmiC33m/8H/9gABMVC0a/jYSjfvo0Xc07CSgfB6aoN6JBi4r0+V6X+fMInGfHe2itQmonm00gbsSxjmIyzmQzodZIxiE8xQlUVoBlYBEGPD5Qf5QjscDNy9hD4k7QF4g6Pblo/rqqicLJfvk+cAG77Blq4GATN9/zCy4Viq3+hkIH72bg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(376002)(396003)(346002)(136003)(451199015)(8676002)(66946007)(6486002)(66556008)(83380400001)(66476007)(316002)(110136005)(86362001)(31696002)(478600001)(36756003)(6506007)(9686003)(38100700002)(5660300002)(26005)(8936002)(186003)(2906002)(2616005)(6512007)(41300700001)(53546011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnFzR0NVQ3BmY1VHUkoxQTBUL1I2SDhyTFIyTTZ3YklpeEJvcUVWQTJ4dThs?=
 =?utf-8?B?YXI5VnB4RTdJeTF0SllUMWxSR3BPa2hWUEt1UEpwWDVkd2ZMb0RhRnRaMlpB?=
 =?utf-8?B?VVBDOGFyODRwZWZ6QnBQOWtNall4VXo4WTF6TXdvRjNIK3RLNUowOS9hRmJx?=
 =?utf-8?B?UUZFWmxOZUd4N1F1YUZjS2lCbThsSi90WmR0MHQyUU9JT3B4bnhzT0VZVGFG?=
 =?utf-8?B?c2dxRHhGSmNOZ3Bhblh6UnZhcmpHK2cwUFNUMXN2Q1V3UzRwTUZxbUlkK2to?=
 =?utf-8?B?R2ZuYlJaZndSem4rQ2F3Rmd4c3VlalJsNmFFZTNWZEhjR3crOVROV0JaejJt?=
 =?utf-8?B?TlBBNE94ZUNIcTRQbEVFUHlDZkJxUUlZY1ZGMW5pbjNkbG5aRFdIT29CbTRw?=
 =?utf-8?B?YlFBY2J6OXJsMjdLYkt5U2lRUWZwblIyaTNKZTRLZGhKVVdDbXN6cTVkQU9M?=
 =?utf-8?B?WlFndTg0SDVURXE0QktGU2ZUNjJua3JTbXBkK2lrdXdJV3ppZVM5OHdsa21l?=
 =?utf-8?B?bXBkczlnSVBQRHlGUTBKUHlVdWptUHRkY3RFelZVZmpvS05WUlZFaWEvYUQ4?=
 =?utf-8?B?bzNldEY3OGpiRUQxdjI2R1BNZUg5akpCNVEyU2J6UUphUXVrSSt0ZksxMk1V?=
 =?utf-8?B?R0oySkcvYzJVZzVmT2d0bm04dmVTS1kyYkRMVWs4Ni9Vb3Z2ajRVRDhPRith?=
 =?utf-8?B?U3kwRlJCVGJvTTAwNGxHaGE3cnltYjhpMHNyaGY3S0dmbjA0aU9qdEg0anVD?=
 =?utf-8?B?R29MbWZQQUhkMjZWek9jWVZMRlFjSTNyVHhSOXlzVGdGR1hRUGx3bXRnNjJC?=
 =?utf-8?B?SktkbHdFTlZwSGR4R09aeWxRRHZTK2tibmdMUVArSjU1eFNocUtrbWRteGIx?=
 =?utf-8?B?a2QzSjE5azQ3MjhXSS9TUVhqb0NXN3RnM2k0dXZGTDlMWG1SYmtwUXZZYUh3?=
 =?utf-8?B?d0pha3lRVk9Ud0xlREh1VStldVhLYmg1TCtaRVNpN3hkT3g2MWxLZUJjRXVF?=
 =?utf-8?B?enFYL2RvaGlyc2RXZjMrYUVpaVRLQ1hkWDloYVVXQThwSU9nNUhKTWthK1lN?=
 =?utf-8?B?Yi9BTjBUd1F5NU8zWFBKNHJPM2dJUFZ6eWw5MGh1SEFaNG0vRVhtakY5QXpN?=
 =?utf-8?B?b3gzQU1Kb0VoSmc0SlJHeUpleGRtU2xsbFRGcWwzUTBmUzR1Slp5c3FCM3Bi?=
 =?utf-8?B?UEU4VzFOMEFnN2xMSEVYZTNaZzlVZkZqVktEWnFsdE5Ua3N4OXlMeForQy8z?=
 =?utf-8?B?WGxFME5QUVB3bXUraFRWbTRsNTMvTC9MVEJIeWlabFV0ZUt5U1oyRlQ3eDYx?=
 =?utf-8?B?bWV5WncxWXlnaXBKVEh2amRDM0lVNkQrWlFwN3ZGMzZrRUIwRVozYW9wZFV0?=
 =?utf-8?B?WWY1NHpibVF1cTU3b3ZsMGUzUXEyMmdGa01xcFI3TUJkRGg4MlJWak9YZ3Vs?=
 =?utf-8?B?TDdpUkVGeUg4bEhFejVBOXFwMktvTGtuVUJ2WE14a1pkdjRISnFieVFNekp2?=
 =?utf-8?B?RjQrdjNjRDRqa2ozblRuK200M0hTVGlMVDNiWGs2MGNvKzFwMGRzSFpKM3RE?=
 =?utf-8?B?cmpjQThubmNwaiszVEVyYmdMU1hXMG9QTFVvOGVJenA3dy9mMXRMUzBxTUpX?=
 =?utf-8?B?bWtSWXNyTnUwRERQRVc0RzZoNlFLYzhLSEsvQ3pPcFphUDdGNDlQbElsSXJJ?=
 =?utf-8?B?R0szZGFqa3JHNG1LYW1IQ0Y2UXZzZkxZbXJGdnB5aTdYdndvcGw5YzdRYTd3?=
 =?utf-8?B?MUhIVy9FWmZ1b3M5SHZwMk8rczFxeFFNbU1LamhJdXZwRjdHTVEyYnZlTnZ1?=
 =?utf-8?B?VEZmcy9Wb25DMSt6VEJpZEJ2T01YOTJ6OHhKQUJXV01SYlFabFdBV2QxdUJP?=
 =?utf-8?B?RFFKOTBJSmEwbkllbzVWeVVwOVU0ZjNTNWRCckcwZHZ6OCt3eklBNHl0ZUVp?=
 =?utf-8?B?S0Y3UFQxOVgyOVA4TEwrd2VkVk84dEkyK0hsMjdGMllsVkIrcnkzK1pVL3BR?=
 =?utf-8?B?L3phN2pHdGtYWDZBRFFoSXllVmxaeDJqblV5SW13ZmY2WmJRaHlmY3B3eGI5?=
 =?utf-8?B?NDJwdUJYTHpGbGFVSFpWU1NaZ1JQek1XQlZqNFhDQ1RZUlczRzZWQmtpOGVR?=
 =?utf-8?B?Slh1blpaS1R1SitCWlIzMFZhODNFTFJOeW9sbVp6YXdDVDdreWx3SlpOSGFX?=
 =?utf-8?Q?arTJUkeCEI41jlITzKp9sDY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 885e2380-0b50-4172-16e4-08daa212a01b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:03:30.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SkR2JVf5hJ/WHPZRuyeqwDaGwJ2iZ8wpcqdsDaWImxGGcbajAJHwQx0fuqH5RvuJzlaOZ3f22tOV3JYf0TnwuOsVfnMWv1pU5UAUadKH/L5gzKBoQw/ktIV9zbx87Nma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7028
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Sep 2022 12:03:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3254

Hi Johan,

On 9/29/22 1:53 PM, Johan Korsnes <johan.korsnes@remarkable.no> wrote:
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Cc: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

> ---
>   documentation/migration-guides/migration-3.4.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> index bc2c75d42..8e0eb3b63 100644
> --- a/documentation/migration-guides/migration-3.4.rst
> +++ b/documentation/migration-guides/migration-3.4.rst
> @@ -22,7 +22,7 @@ syntax, so the following::
>   
>      SRC_URI_append = " file://somefile"
>      SRC_URI_append_qemux86 = " file://somefile2"
> -   SRC_URI_remove_qemux86-64 = " file://somefile3"
> +   SRC_URI_remove_qemux86-64 = "file://somefile3"
>      SRC_URI_prepend_qemuarm = "file://somefile4 "
>      FILES_${PN}-ptest = "${bindir}/xyz"
>      IMAGE_CMD_tar = "tar"
> @@ -34,7 +34,7 @@ would now become::
>   
>      SRC_URI:append = " file://somefile"
>      SRC_URI:append:qemux86 = " file://somefile2"
> -   SRC_URI:remove:qemux86-64 = " file://somefile3"
> +   SRC_URI:remove:qemux86-64 = "file://somefile3"
>      SRC_URI:prepend:qemuarm = "file://somefile4 "
>      FILES:${PN}-ptest = "${bindir}/xyz"
>      IMAGE_CMD:tar = "tar"
> 

