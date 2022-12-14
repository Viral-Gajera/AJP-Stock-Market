<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0" />

        <!-- TAILWIND CDN -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- CONFIG JS -->
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: "#2196F3",
                        },
                    },
                },
            };
        </script>

        <!-- CUSTOM CSS -->
        <style type="text/tailwindcss">
            @layer utilities {
                .content-auto {
                    content-visibility: auto;
                }
            }
        </style>
    </head>
    <body
        class="flex items-center justify-center min-h-screen text-white bg-gradient-to-bl from-gray-900 to-black">
        <!-- NAVIGATION BAR -->
        <section>
            <div
                class="fixed top-0 left-[50%] mx-auto flex h-16 w-11/12 -translate-x-[50%] items-center justify-between">
                <!-- LEFT SECTION : LOGO -->
                <div class="flex items-center">
                    <span>
                        <a href="./index.jsp">

                            <img
                            class="w-10 mx-2"
                            src="./img/tradingview.png"
                            alt="" />
                        </a>
                    </span>
                    <span
                        class="text-xl font-bold text-white">
                        Trading View
                    </span>
                </div>

                <!-- RIGHT SECTION : LINKS -->
                <div class="mr-2 font-bold"></div>
            </div>
        </section>

        <!-- MAIN SECTION -->
        <section class="h-96">
            <!-- CONTAINER -->
            <div
                class="px-5 py-12 mx-auto bg-gray-800 rounded-lg w-96">
                <!-- HEADING -->
                <h1
                    class="mb-6 -mt-2 text-xl font-bold text-center">
                    Login
                </h1>

                <!-- FORM -->
                <form
                    action="authentication.jsp"
                    class="flex flex-col items-center justify-center">

                    <!-- EMAIL ADDRESS FIELD -->
                    <div class="mt-5 border-b-2">
                        <div class="pl-0.5">
                            Email Address
                        </div>
                        <div
                            class="flex items-center mb-2">
                            <span
                                ><img
                                    class="inline w-6 mt-2 mr-4"
                                    src="./Img/icons8-user-48.png"
                                    alt=""
                            /></span>
                            <input
                                class="inline w-56 mt-2 bg-transparent outline-none"
                                type="email"
                                placeholder="Type user name is here"
                                name="email"
                                id=""
                                required />
                        </div>
                    </div>

                    <!-- PASSWORD FIELD -->
                    <div class="mt-5 border-b-2">
                        <div class="pl-0.5">
                            Password
                        </div>
                        <div
                            class="flex items-center mb-2">
                            <span
                                ><img
                                    class="inline w-5 mt-2 mr-4"
                                    src="./Img/icons8-lock.svg"
                                    alt=""
                            /></span>
                            <input
                                class="inline w-56 mt-2 bg-transparent outline-none"
                                type="password"
                                placeholder="Type password is here"
                                name="password"
                                id="" 
                                required />
                        </div>
                    </div>

                    <!-- LOGIN BUTTON -->
                    <div class="mt-12">
                        <label for="login" >
                        <div
                            class="py-2 font-bold rounded-full bg-primary px-28">
                            <input type="submit" value="Login" id="login" >
                        </div>
                    </label>
                    </div>

                    <!-- OR SIGN UP -->
                    <div class="mt-5 -mb-3">
                        Or
                        <span class="text-primary"
                            ><a
                                href="./signUp.jsp"
                                >Sign Up</a
                            ></span
                        >
                    </div>
                    
                </form>
            </div>
        </section>
    </body>
</html>
