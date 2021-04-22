Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.55])
 by mx.groups.io with SMTP id smtpd.web11.408.1619109760354253259
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 09:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WOitlLNR;
 spf=pass (domain: windriver.com, ip: 40.107.95.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3ZFcvCN8YM+eeN2Y4S5QThK3PtHU8ByUnqAYxE7Q2y1JMKdNQtNDMvZLNW+HwObM4MO+8P4JLDc6NWp3DW3DigIo/QlSDlHL9PBzYALV9i+UBASaIfmKnshbq8yw4Z5YhV9K/corpa+Kfj8yDtf8HIEj6jb4UUYRH8Jbf+sHzLXcYB8SBHsutYN9hxkFMtjtw5uhITzCsUebHs868pvHKj/1YxrXCE93FTgGLTf70/d27Ad8jTIHKu8+rUSAIM4DObTp6AsOSqeldRwwiw1Ea5j/0z7q+tBpPA4HrH+wu5P5neerLBx9Q62utGMIuVYKnHkjezscPQQp7peTkjMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJv7CuMoviGcn9zjrv5yJKItklyRFJ9JO4DD+eDVyQY=;
 b=JQQBswZs/P5w/Yx7L9GP3PKGMwHFXVSgzev6FtZzdBjJ+YkJnRE2bcUOQTGFcieISYmVEkGoE3hUkOCR9HUxDQ0YAYlgnYk8egtckizVtH2wTX1O8J2dGm5Jgdn4DXKtpkCNK4YLvlSueAdwX+c3qxds0RFE+mR5o4emApNpJ0kqiDjkSk1mNZZckmOzIA74IoAmwclytUpXimZSzSTOab2xPIszkBR2QIQLNukUo7yngTLqPDXPwwDfjUNOx43tQEeHsXz+Nwm/MkOYPIhbVuex6mUsUvNLEMkSxw6DMgU9qeEgcbbKCKQKEuvygXP6nOABXQJHUrl2B0cNeK+nAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJv7CuMoviGcn9zjrv5yJKItklyRFJ9JO4DD+eDVyQY=;
 b=WOitlLNRvYUnemLz1oTJlOmG4CshmShoC5e5SwA/aM/5ghibFpdsy0azqweSOcMt34ELjvy7ssAsNKqdPAEqZ0ujTtpImxlIyoVh6SLEilufeGThYFKVdfMFAHX3GOG4cXF4j0+Es5W0LEs4ajaq3hTSpnoEY0GsXkoxU3B+CwE=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 22 Apr
 2021 16:42:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 16:42:39 +0000
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <16783B7361829FC0.16298@lists.yoctoproject.org>
 <20210422163940.300616-1-michael.opdenacker@bootlin.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <84d9d663-7366-f2eb-8405-ec002b57526c@windriver.com>
Date: Thu, 22 Apr 2021 12:42:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210422163940.300616-1-michael.opdenacker@bootlin.com>
X-Originating-IP: [2607:fea8:c29d:d7c0::12bc]
X-ClientProxiedBy: BN0PR04CA0049.namprd04.prod.outlook.com
 (2603:10b6:408:e8::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::12bc] (2607:fea8:c29d:d7c0::12bc) by BN0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:408:e8::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 16:42:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5af57ec5-f092-4bb8-c5db-08d905ada3f0
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5134:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5134C105CAFF55CD419A08F39F469@SJ0PR11MB5134.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oYe7ap1ippJ0oBe+XsflvmOtFOcv83lcBF0quvCFxWsm0yaG1/QvXUJMBx+x06i6cArzHV4Qy5D/8GpK1YKfC2J0GZPNlBCTJqWe0tSUQ7xoUmyymIO6wFBcv4AxLvP2ZN3+slVO4vcjQ/0ClsPF4yQ8u7euSe+wAmnGbBQN2py9GN4phU5s5fwmnP8kzL3HYO6gINiauSJPvxSLF0NA0mjiZHgPn9G+s89drtJPRZFcKXV0ihnXyFi5Mz93hgcD9/QHg/gXjP2aNA66pUp8l3aFXeEEU5L0KSxyFtqIlww/uapz0In+V7u8zx0xvVEOXHHkhQTz1rbMoD9hEFjhgVFBo30IjRsMQCqFtd52pfhyyLtEZf+30zBgewSv7+a5UsgVwT9TK3xjOU7ehrSXM1fQzM7R00XqkKsqb7D2vKaC0tdaFhsBlhs2eej6goaQLF9ZX3jsXQVbY0E3vY0mJjpYx3aUBgHG978WP2o1J5WLI6RCnpCHv6y7RXGNdVNvXyA0hWWP00bGa3AlZc+4jF4xS5kjbs8PvwSQwYram0+YteMFGhIMgW5eYpW0DNacKXTo0SX3+8sIu+hc6PqPftWXnM0bkzOnmtCTI4us4FUW2knSm+WklqCYa3YT5f+h0wPSnki/03DOsrVBwJWefIMXnZG/HxX7r+GZ4H7+DkyEfQqkhRFzQ8f0fjLOjZ1li3fP0s86B5GxUHXs4RD0ltZG+q7GIAEOHbrEk4LEJfrgmiZP2dmOSBkUdQslFGQV59xSICWZr70dTGpjhqXFgA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39830400003)(396003)(8936002)(86362001)(44832011)(31696002)(316002)(83380400001)(31686004)(5660300002)(2616005)(8676002)(36756003)(166002)(33964004)(53546011)(66556008)(66476007)(38100700002)(6486002)(966005)(66946007)(16526019)(186003)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YnAvT1JqMFlBNXlOQ3FrWUFjWm1TNCtQdWNZdXJFV2w2NlFqbm85akxTV1JO?=
 =?utf-8?B?VHlORmsrYVRYMWZsNUw1cG8yYzMycW0rUy9rVHRQcmZXMUhDOEw4ZGNJYlNQ?=
 =?utf-8?B?K3JTSzcxU1hHMHFNMG0yZFZ5V2Ztbkw4WkVUcVNMVTZDaWFIZ3FQQXlFaEVn?=
 =?utf-8?B?c0hrTjhORmJaTVdidVV4UlRwVHNtN0JCQk04MkVTcWxQTGx0T08zaEZ1ZVNC?=
 =?utf-8?B?a2prWTFHekpjRFF6ejR1SllLMDRDeUR4bjR0Z1pERnBPMFUxSGtRMFgxMGdU?=
 =?utf-8?B?aGFKeEJXalUrb0JxOW5tbEhaRys2eUs2VUg2QXAyVWwxSElyRWlvcDdzWU9l?=
 =?utf-8?B?TkhGZzBjYTB1ZkNmbXo2YzJ6c1p1VTFlS2ZyREYxcGlOejErenlPNGJNQzNQ?=
 =?utf-8?B?YjRRZ3kybmRJRjBDdzBEanhCZ2Erald2SU1xNUx5SHdpbnNWUVZZeWN2NVpq?=
 =?utf-8?B?aFhRSkxsV3c1ckdrd0xTZjZsd3plTUVlSkNqWHdJcHVEMS9wb1kzWEprbHlk?=
 =?utf-8?B?Z2RJbUdKbGE3TnpUUkt5UGpHZTY1ZFVxV0JkRTBJTW1ya2tDNS9OUWJ5aU5D?=
 =?utf-8?B?OEtDV290VSsyeHpobnA2V1JkNk1oUVNKNDlCcjFyNDVXNTd5TGtYZVluMWJW?=
 =?utf-8?B?M2w5anF1RFlOUXJ2VS9wYUxNVThiVFgrOE1PaUJJT3NSNmxCRVJLZGU5eUZi?=
 =?utf-8?B?WGgrSForaXNOMmFYbWVkU3RXV1gvcmcrUlBqZjA0emNzS1NCRlBpTkt5dVQ4?=
 =?utf-8?B?dEJKWU5XMmJrdGZYOHlsNlNSZDVPcEtLc1NadG1jRTVPVTAvS0NOOEhaMkpL?=
 =?utf-8?B?ekxEdjJUYUhLZForZVZyUlBpeTYxR1dJOHlhWkxrdGNCaXBadzlPdCtmcnEv?=
 =?utf-8?B?aEtSRk9rM3Q3MmhrV1h5ejFDdjJGSmtaVUlmakpuNjRVbytjZ0VTRGFQdXN2?=
 =?utf-8?B?MDZsaHlCQUFMTjBPREc2alV6MXlHNjNyZ0w0NDM4TVFaQjlSWjNoaUlJaDRU?=
 =?utf-8?B?cGRtZUg5QzhFRmtubnIrblJJR2RJdVJXVlhocTMrbXlVVUd6bnl0K0FXRlQ3?=
 =?utf-8?B?MklSU09QZVZ2dU1XUS9JV213ekIxMnNJa2RpVkVQeVZZeXBxeWZIMTJqQ0d0?=
 =?utf-8?B?SGZ3VzVPOHBqQW9qdDFWNGU2R0VoQkJwTUEvM2t1T2ZTNUgxK3NlMHBtZUZC?=
 =?utf-8?B?T1JIcE1ud2t2QWRwR3Z3VUZ4SERQbHp0anl6Ti9FNHF2dFdySU42ZG9qdW43?=
 =?utf-8?B?d3pnTERjUHM3MDI1SElMbkdCRWJRSitMTzgvWFlrQW5RemExM0w4NGtPMUZ4?=
 =?utf-8?B?NDY4ZEM1eHRPUFdUNmlUZFdKWHg5RnE2eGVJUS9CYmR2ZnhabFg1aVh4NU9U?=
 =?utf-8?B?WGxUY1VyRDdreWtpOGVnUmZSdUVtSTVWTk9oOGhMdEgzZ243aUdqV2MzR3RY?=
 =?utf-8?B?RVRMOG05VVRMVWhVNDNvWUJxTHZDdjlxTEJyMDlvSER6ZHc2aWE5Z1JPd2I2?=
 =?utf-8?B?UWorSnFSaElIZmtFdTBFS3N0UzdaUG5Bbm1DZmhIRFRBeE9kMmdkVkkyVHJO?=
 =?utf-8?B?NC9iMVRoc0lhMk9HRWFpRjVudTE5c1Y2RTdNNXg0VVU1WXFzdFA2QnpPLzFB?=
 =?utf-8?B?Q1dKcElpUjJtZHFpbDNwSEw5MjlVK09UZ2N3djhPVUt4QmtGRUVHWHNxQXA3?=
 =?utf-8?B?VEhUdEhsSFJOK3ZESGlHVmpvcERKNEVuSTVQYjEzRWJ4NzVvTXdjNVpINnlH?=
 =?utf-8?B?Ykp1QkJMejdXak1Jb29HR1J4OG50bnNxQ05Ydi80elRWOUxYcGRDVVVHOHZt?=
 =?utf-8?B?azJXemNZWnMxcWxKclVZUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af57ec5-f092-4bb8-c5db-08d905ada3f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:42:38.9741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6B6Zegd0KeUk+FmxXzB+iQI/Yuq/7bLbZULH4jkn2n3P8uQb072/+R3CtOa4Cl0wQRUkyzDfYvs5VJpxBJBEC7ddSBhiVLtZXDDE+6qPnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
Content-Type: multipart/alternative;
 boundary="------------CA7018626A374FBA2A9BE603"
Content-Language: en-US

--------------CA7018626A374FBA2A9BE603
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-04-22 12:39 p.m., Michael Opdenacker wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> See [YOCTO #13921]
>
> Add details to the SERIAL_CONSOLES_CHECK entry to clarify that it
> doesn't work with read-only rootfs.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 64521b89bb..3297a69edf 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6694,7 +6694,11 @@ system and gives an overview of their function and contents.
>            SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"
>
>         This variable is currently only supported with SysVinit (i.e. not
> -      with systemd).
> +      with systemd). Note that :term:`SERIAL_CONSOLES_CHECK` also requires
> +      ``/etc/inittab`` to be writable when used with SysVinit. This makes it
> +      incompatible with customizations such as the following::
> +
> +         EXTRA_IMAGE_FEATURES += "read-only-rootfs"
>
>      :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
>         A list of recipe dependencies that should not be used to determine
> --
> 2.25.1
Thanks for making the necessary changes :)
>
>
> 
>

--------------CA7018626A374FBA2A9BE603
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-04-22 12:39 p.m., Michael
      Opdenacker wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210422163940.300616-1-michael.opdenacker@bootlin.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>

See [YOCTO #13921]

Add details to the SERIAL_CONSOLES_CHECK entry to clarify that it
doesn't work with read-only rootfs.

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
Reviewed-by: Michael Opdenacker <a class="moz-txt-link-rfc2396E" href="mailto:michael.opdenacker@bootlin.com">&lt;michael.opdenacker@bootlin.com&gt;</a>
---
 documentation/ref-manual/variables.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 64521b89bb..3297a69edf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6694,7 +6694,11 @@ system and gives an overview of their function and contents.
          SERIAL_CONSOLES_CHECK = &quot;slcp_line0:ttyS0&quot;

       This variable is currently only supported with SysVinit (i.e. not
-      with systemd).
+      with systemd). Note that :term:`SERIAL_CONSOLES_CHECK` also requires
+      ``/etc/inittab`` to be writable when used with SysVinit. This makes it
+      incompatible with customizations such as the following::
+
+         EXTRA_IMAGE_FEATURES += &quot;read-only-rootfs&quot;

    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
--
2.25.1</pre>
    </blockquote>
    Thanks for making the necessary changes :)<br>
    <blockquote type="cite" cite="mid:20210422163940.300616-1-michael.opdenacker@bootlin.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CA7018626A374FBA2A9BE603--
